class AddCreateUserIdToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :create_user_id, :integer, null: false
  end
end
