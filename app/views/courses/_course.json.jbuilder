json.extract! course, :id, :course_name, :description, :course_content, :created_at, :updated_at
json.url course_url(course, format: :json)
