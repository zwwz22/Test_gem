class Rou::HomesController < Rou::ApplicationController

  def index
    a = request.user_agent.include?('chrome')
    logger.info a
  end

  def show
    redirect_to :action => 'index'
  end

  def new
  end
end
