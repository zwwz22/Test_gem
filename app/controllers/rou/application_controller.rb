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
    if session[:user].present?
      @current_user = User.where(:id =>session[:user]).first
    end
    login?
  end

 if Rails.env.production?
   unless Rails.application.config.consider_all_requests_local
 rescue_from Exception, with: :render_404
 rescue_from ActionController::RoutingError, with: :render_404
 rescue_from ActionController::UnknownController, with: :render_404
 rescue_from ActionController::UnknownAction, with: :render_404
 rescue_from ActiveRecord::RecordNotFound, with: :render_404
 end
 end

 private
 def render_404(exception)
   @not_found_path = exception.message
   respond_to do |format|
     format.html { render template: 'rou/errors/not_found', layout: 'rou/layouts/application', status: 404 }
     format.all { render nothing: true, status: 404 }
   end
 end

end
