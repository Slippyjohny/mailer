class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.string :token
      t.string :email
      t.belongs_to :event, index:true
      t.belongs_to :sender, index:true
      t.belongs_to :recipient, index:true
      t.timestamps
    end
  end
end
