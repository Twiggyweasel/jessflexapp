class CreateActivitySets < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_sets do |t|
      t.int :order
      t.has_many :activity_blocks

      t.timestamps
    end
  end
end
