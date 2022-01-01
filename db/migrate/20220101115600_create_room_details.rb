class CreateRoomDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :room_details do |t|
      t.string :place
      t.date :date
      t.integer :number_of_people
      t.integer :treat_id
      t.string :atmosphere
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
