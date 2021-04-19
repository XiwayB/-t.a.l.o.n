json.array! @messages do |message|
  json.extract! message, :content, :user_id, :receiver_id
  json.sendavatar message.user.avatar
  json.sendusername message.user.wechat_account
  json.recavatar message.receiver.avatar
  json.recusername message.receiver.wechat_account
end
