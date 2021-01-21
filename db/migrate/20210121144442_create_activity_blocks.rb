class CreateActivityBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_blocks do |t|
      t.belongs_to :activity, null: false, foreign_key: true
      t.integer :rep
      t.integer :set
      t.integer :weight

      t.timestamps
    end
  end
end
