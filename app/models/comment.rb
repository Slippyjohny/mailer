class Comment < ApplicationRecord

  belongs_to :event
  belongs_to :user

  validates :body, presence: true, length: {minimum: 2}
  scope :latest, -> (number) { order("created_at DESC").limit(number) }

  after_create_commit { MessageBroadcastJob.perform_later(self) }


end
