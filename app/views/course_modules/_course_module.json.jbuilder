json.extract! course_module, :id, :module_name, :year_id, :credits, :created_at, :updated_at
json.url course_module_url(course_module, format: :json)
