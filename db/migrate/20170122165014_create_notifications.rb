class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :creator, index: true
      t.belongs_to :invite
      t.belongs_to :event
      t.integer :attached_user_id
      t.timestamps
    end
    add_index :notifications, [:event_id, :attached_user_id], unique: true
  end
end
