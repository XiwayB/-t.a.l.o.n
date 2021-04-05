class User < ApplicationRecord
  validates :wechat_account, :role, :pictures, :location, :status,:open_id, presence: true
end

