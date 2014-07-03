class ArticlesController < ApplicationController

  def index
    @articles = Article
    if params[:category_id].present?
      @articles = @articles.where(:category_id => params[:category_id])
    end
    @articles = @articles.paginate(:page => params[:page],:per_page => 3)
  end

  def show
    @article = Article.find params[:id]
  end
end
