class User < ApplicationRecord
  ROLE = ['patient', 'medic']
  STATUS = ['healthy', 'critical', 'non-critical']
  validates :open_id, presence: true
  validates :role, inclusion: { in: ROLE }, presence: true
  validates :status, inclusion: { in: STATUS }, presence: true

  serialize :location

  has_many_attached :photos
end

