class Notification < ApplicationRecord
  validates :event_id, uniqueness: { scope: :attached_user_id }
  belongs_to :invite
  belongs_to :event
  belongs_to :attached_user, class_name: 'User'
end
