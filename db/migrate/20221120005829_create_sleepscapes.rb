class CreateSleepscapes < ActiveRecord::Migration[7.0]
  def change
    create_table :sleepscapes do |t|
      t.string :title
      t.string :recorded_at
      t.string :description
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
