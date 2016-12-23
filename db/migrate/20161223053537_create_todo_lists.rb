class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.string :content
      t.boolean :delete_flg
      t.integer :user_id
      t.integer :created_by
      t.datetime :deadline
      t.datetime :remind

      t.timestamps null: false
    end
  end
end
