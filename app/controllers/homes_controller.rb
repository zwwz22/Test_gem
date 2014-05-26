class HomesController < ApplicationController
  #doorkeeper_for :all

  def index
    a = request.user_agent.include?('chrome')
    logger.info a
    @articles = Article.all
  end

  def show
    redirect_to :action => 'index'
  end

  def new
  end
end
