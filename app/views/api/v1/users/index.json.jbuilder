json.users do
  json.array! @users do |user|
    json.extract! user, :id, :wechat_account, :role, :location, :status, :open_id
      json.url user.photos.last.service_url if user.photos.present?
    end
end
