class Document < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  belongs_to :event
  belongs_to :user
  scope :latest, -> (number) {order("created_at DESC").limit(number) }
  validates :attachment, presence:true
  validates :name, presence:true
end
