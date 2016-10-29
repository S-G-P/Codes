json.extract! schedule, :id, :title, :date_from, :date_to, :place, :content, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)