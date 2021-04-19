json.messages do
  json.array! @messages do |message|
    # json.extract! message, :user_id, :receiver_id
    json.user_id @user_id
    json.receiver_id message.id
    json.recavatar message.avatar
    json.recusername message.wechat_account
  end
end
