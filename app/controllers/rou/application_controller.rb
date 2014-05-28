class Rou::ApplicationController < ApplicationController
 layout 'rou/layouts/application'

  def login?
    unless @current_user.present?
      p remember_redirect_url
      render login_rou_users_path,:layout => false
    end
  end

  def remember_redirect_url
    session[:url] = request.url
  end

  def current_user_info
    if session[:user].present? && User.where(:id =>session[:user]).present?
      @current_user = User.where(:id =>session[:user]).first
    end
    login?
  end

end
