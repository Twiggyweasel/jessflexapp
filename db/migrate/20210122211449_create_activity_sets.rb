class CreateActivitySets < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_sets do |t|
      t.integer :order

      t.timestamps
    end
  end
end
