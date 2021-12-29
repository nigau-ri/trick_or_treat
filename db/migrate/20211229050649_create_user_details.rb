class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.integer :age
      t.integer :gender_id, null: false
      t.integer :prefecture_id
      t.string :city
      t.string :hobby
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
