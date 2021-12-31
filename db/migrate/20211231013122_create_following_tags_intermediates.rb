class CreateFollowingTagsIntermediates < ActiveRecord::Migration[6.0]
  def change
    create_table :following_tags_intermediates do |t|
      t.references :following, null: false, foreign_key: true
      t.references :following_tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
