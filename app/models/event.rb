class Event < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :attached_events_users
  has_many :attached_users, through: :attached_events_users, source: :user
  has_many :invites
  has_many :documents
  has_many :comments
  has_many :notifications
  pg_search_scope :search_everywhere, against: [:created_at]
  validates :place, presence: true, length: {minimum: 3, maximum: 40}
  validates :description, presence: true, length: {minimum: 5, maximum: 100}

  validates :time,
            date: {after: Proc.new { Time.now },
                   before: Proc.new { Time.now + 1.year }}
  validates :end_time,
            date: {after: :time}


  after_create :telegram_bot


  def telegram_bot
    TelegramWorker.perform_async(self.id)
  end

end


