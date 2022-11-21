class CreateFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :followings do |t|
      t.string :following_id
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
