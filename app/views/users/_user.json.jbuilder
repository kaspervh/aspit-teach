json.extract! user, :id, :username, :email, :password_digest, :role_id, :school_id, :grade_id, :created_at, :updated_at
json.url user_url(user, format: :json)