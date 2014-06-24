class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :form_user
      t.string :to_user
      t.string :content
      t.timestamps
    end
  end
end
