class Rou::ArticlesController < Rou::ApplicationController
  before_filter :find_article,:only => [:edit,:update,:destroy,:show]
  def index
    @web_title = '文章列表'
    @articles = Article.paginate(:page =>params[:page],:per_page => 20)
  end

  def new
    @web_title = '新文章'
    @article = Article.new
  end

  def show
    @web_title = '文章'
  end

  def create
    @article = Article.new params[:article]
    if @article.save
      redirect_to rou_articles_path,:notice => '创建成功'
    else
      render 'new'
    end
  end

  def edit
    @web_title = '编辑文章'
  end

  def update
    @article.update_attributes params[:article]
    if @article.save
      redirect_to rou_articles_path,:notice => '更新成功'
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to rou_articles_path,:notice => '删除成功'
  end

  private
  def find_article
    @article = Article.find params[:id]
  end
end
