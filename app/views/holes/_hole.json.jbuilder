json.extract! hole, :id, :yardage, :par, :handicap, :polygon_map,
              :center_of_green_longitude, :center_of_green_latitude, :course_id, :created_at, :updated_at
json.url hole_url(hole, format: :json)
