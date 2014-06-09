require 'digest/sha1'
class Rou::UsersController < Rou::ApplicationController
  before_filter :current_user_info,:except =>[:login,:log_out,:create]

  def login
    if request.post?
      user = User.find_user(params[:name],params[:password])
      if user.present?
        session[:user] = user.id
        redirect_to  session[:url].present? ? session[:url]:rou_articles_path
      else
        session[:user] = nil
        render login_rou_users_path,:layout => false
      end
    else
      render login_rou_users_path,:layout => false
    end

  end

  def log_out
    session[:user] = nil
    redirect_to  session[:url].present? ? session[:url]:rou_articles_path
  end

  def index
    @users = User.order_desc.all
    respond_to do |format|
      format.html
      format.xls {
        send_data @users.to_xls(:columns => [:name],:headers => ['姓名']), :filename => 'users22.xls'
      }
    end
  end

  def new
    @user = User.new
  end

  def create
    params[:user][:password] = Digest::SHA1.hexdigest(params[:user][:password])
    params[:user][:password_confirmation] = Digest::SHA1.hexdigest(params[:user][:password_confirmation])
    @user = User.new params[:user]
    if @user.save
      session[:user] = @user.id
      redirect_to rou_articles_path
    else
      render login_rou_users_path,:layout => false
    end

  end

  def get_arr
    user_id = params[:user_id]
    user = User.where(:id => user_id)
    render :json => user.to_json
  end

  def edit
    @user = User.find params[:id]
  end

end
