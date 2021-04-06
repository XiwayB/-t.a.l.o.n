json.users do
  json.array! @users do |user|
    json.extract! user, :wechat_account, :role, :location, :status, :open_id, :pictures
  end
end
