class CreateTodoListUsers < ActiveRecord::Migration
  def change
    create_table :todo_list_users do |t|
      t.integer :todo_list_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
