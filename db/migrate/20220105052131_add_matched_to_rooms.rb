class AddMatchedToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :matched, :string, default: 'yet'
  end
end
