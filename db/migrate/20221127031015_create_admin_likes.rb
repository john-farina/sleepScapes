class CreateAdminLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_likes do |t|
      t.integer :liked_id
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
