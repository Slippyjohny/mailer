class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :sender, class_name: 'User'
  has_many :notifications
  before_create :generate_token
  before_create :check_user_existence
  validates :email, email: true
  def generate_token
    self.token = Digest::SHA1.hexdigest([self.event_id, Time.now, rand].join)
  end

  def check_user_existence
    recipient = User.find_by_email(email)
    if recipient
      self.recipient_id = recipient.id
      Notification.create(creator_id: self.event.user_id, attached_user_id: recipient.id, event_id: self.event.id,
      invite_id: self.id)
    end
  end
end
