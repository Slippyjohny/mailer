class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :place
      t.datetime :time
      t.datetime :end_time
      t.string :description
      t.belongs_to :user
      t.timestamps
    end
  end
end
