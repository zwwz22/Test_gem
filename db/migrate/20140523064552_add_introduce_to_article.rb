class AddIntroduceToArticle < ActiveRecord::Migration
  def change
    add_column :articles,:introduce,:string,:comment => '文章主旨'
  end
end
