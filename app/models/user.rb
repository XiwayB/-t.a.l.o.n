class User < ApplicationRecord
  validates :wechat_account, :role, :pictures, :location, :status, presence: true
end

