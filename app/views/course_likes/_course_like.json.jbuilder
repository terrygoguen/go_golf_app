json.extract! course_like, :id, :user_id, :course_id, :created_at, :updated_at
json.url course_like_url(course_like, format: :json)
