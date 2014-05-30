class Rou::ApplicationController < ApplicationController
 layout 'rou/layouts/application'

  def login?
    unless @current_user.present?
      remember_redirect_url
      redirect_to login_rou_users_path,:layout => false
    end
  end

  def remember_redirect_url
    session[:url] = request.fullpath unless request.fullpath.include? '/rou/users/login'
  end

  def current_user_info
    if session[:user].present? && User.where(:id =>session[:user]).present?
      @current_user = User.where(:id =>session[:user]).first
    end
    login?
  end

end
