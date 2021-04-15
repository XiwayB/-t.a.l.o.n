class Message < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: "User"

  validates :content, presence: true, length: { minimum: 1 }
end
