class CreateVariations < ActiveRecord::Migration[6.1]
  def change
    create_table :variations do |t|
      t.integer :difficulty
      t.integer :weight
      t.integer :set
      t.integer :rep
      t.belongs_to :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
