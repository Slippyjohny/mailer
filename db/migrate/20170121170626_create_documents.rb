class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.belongs_to :event, index:true
      t.belongs_to :user, index:true
      t.string :name
      t.string :attachment
      t.timestamps
    end
  end
end
