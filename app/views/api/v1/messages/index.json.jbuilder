json.messages do
  json.array! @messages do |message|
    # json.extract! message, :content, :user_id, :receiver_id
    json.recavatar message.avatar
    json.recusername message.wechat_account
  end
end
