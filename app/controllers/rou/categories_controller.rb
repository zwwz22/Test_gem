class Rou::CategoriesController < Rou::ApplicationController
  before_filter :current_user_info
  def index
    @web_title = '分类目录'
    @categories= Category.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @web_title = '新增分类'
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to rou_categories_path,:notice => '创建成功'
    else
      render 'new'
    end
  end

  def edit
    @web_title = '编辑'
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    @category.update_attributes params[:category]
    if @category.save
      redirect_to rou_categories_path,:notice => '更新成功'
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to rou_categories_path,:notice => '删除成功'
  end


end
