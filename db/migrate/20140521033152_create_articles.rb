class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer   :category_id, :comment => '分类ID'
      t.string    :title, :comment => '文章标题'
      t.text      :content, :comment => '文章内容'
      t.timestamps
    end
  end
end
