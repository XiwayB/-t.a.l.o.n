class User < ApplicationRecord
  validates :wechat_account, :role, :location, :status, :open_id, presence: true
end

