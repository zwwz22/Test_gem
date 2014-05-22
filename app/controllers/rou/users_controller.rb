class Rou::UsersController < Rou::ApplicationController

  def index
    @users = User.order_desc.all

    #UserMailer.welcome_email.deliver

    @user_name = User.first.name
    @user_arr = User.where(:name => @user_name)

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
