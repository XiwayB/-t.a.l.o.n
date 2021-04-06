class User < ApplicationRecord
  ROLE = ['patient', 'medic']
  STATUS = ['healthy', 'critical', 'non-critical']
  validates :wechat_account, :location, :open_id, presence: true
  validates :role, inclusion: { in: ROLE }, presence: true
  validates :status, inclusion: { in: STATUS }, presence: true

  serialize :location
end

