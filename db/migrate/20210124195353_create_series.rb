class CreateSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :series do |t|
      t.integer :set, null: false
      t.integer :rep, null: false

      t.belongs_to :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
