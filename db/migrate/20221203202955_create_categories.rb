class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :category
      t.belongs_to :sleepscape, null: false, foreign_key: true

      t.timestamps
    end
  end
end
