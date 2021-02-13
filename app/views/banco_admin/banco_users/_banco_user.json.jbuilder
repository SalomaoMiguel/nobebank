json.extract! banco_user, :id, :nome, :email, :senha, :banco_id, :created_at, :updated_at
json.url banco_user_url(banco_user, format: :json)
