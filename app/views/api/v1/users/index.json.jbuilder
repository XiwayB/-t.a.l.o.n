json.users do
  json.array! @users do |user|
    json.extract! user, :id, :wechat_account, :role, :location, :status, :open_id, :avatar, :description
    json.url user.photos.last(3).map{|photo| photo.service_url}
  end
end
