class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :simple_desc
      t.string :detail_desc
      t.integer :location
      t.integer :category
      t.integer :set_label
      t.boolean :has_weight
      t.boolean :machine_based

      t.timestamps
    end
  end
end
