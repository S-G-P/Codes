json.extract! todo_list, :id, :title, :content, :delete_flg, :user_id, :created_by, :deadline, :remind, :created_at, :updated_at
json.url todo_list_url(todo_list, format: :json)