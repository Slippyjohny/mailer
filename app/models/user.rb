class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events
  has_many :attached_events_users
  has_many :attached_events, through: :attached_events_users, source: :event
  has_many :invitations, class_name: 'Invite',:foreign_key => 'recipient_id'
  has_many :sent_invites, class_name: 'Invite', :foreign_key => 'sender_id'
  has_many :comments, dependent: :destroy
  has_many :notifications, foreign_key: :attached_user_id
  has_many :documents
end
