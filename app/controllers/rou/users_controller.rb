class Rou::UsersController < Rou::ApplicationController
  before_filter :current_user_info,:except =>[:login,:log_out]

  def login
    if request.post?
      if params[:name] == 'admin' && params[:password] == 'kai7321'
        session[:user] = 1
        if session[:url].present?
          redirect_to session[:url]
        else
          redirect_to rou_articles_path
        end
      else
        session[:user] = nil
        render login_rou_users_path,:layout => false
      end
    else
      render login_rou_users_path,:layout => false
    end

  end

  def log_out
    p session[:url]
    session[:user] = nil
    if session[:url].present?
      redirect_to session[:url]
    else
      redirect_to rou_articles_path
    end
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
