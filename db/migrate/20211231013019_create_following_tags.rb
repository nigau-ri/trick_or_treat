class CreateFollowingTags < ActiveRecord::Migration[6.0]
  def change
    create_table :following_tags do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :following_tags, [:name], unique: true
  end
end
