class CreateVariations < ActiveRecord::Migration[6.1]
  def change
    create_table :variations do |t|
      t.text :description
      t.integer :weight

      t.belongs_to :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
