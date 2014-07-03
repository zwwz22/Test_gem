class HomesController < ApplicationController
  #doorkeeper_for :all

  def index
    a = request.user_agent.include?('chrome') unless Rails.env == 'test'
    @articles = Article.order('created_at desc').limit 6
  end

  def show
    redirect_to :action => 'index'
  end

  def new
  end
end
