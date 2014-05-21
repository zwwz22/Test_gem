class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :name, :comment => '分类名称'
      t.timestamps
    end
  end
end
