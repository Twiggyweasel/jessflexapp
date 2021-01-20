class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      #strings
      t.string :name
      t.string :simple_desc
      t.string :detail_desc

      #enums      
      t.integer :location
      t.integer :category
      t.integer :set_label

      #integers
      t.integer :weight
      t.integer :rep
      t.integer :set

      #bools
      t.boolean :machine_based, default: false
      t.boolean :has_weight, default: false

      t.timestamps
    end
  end
end
