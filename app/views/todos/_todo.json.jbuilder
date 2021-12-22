json.extract! todo, :id, :title, :complelte, :created_at, :updated_at
json.url todo_url(todo, format: :json)
