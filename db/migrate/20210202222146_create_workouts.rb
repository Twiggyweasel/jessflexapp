class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :description

      t.boolean :bundle_only, default: true 

      t.integer :time, default: 10
      t.integer :price, default: 0
      t.integer :difficulty, default: 0
      t.integer :status, default: 0
      
      t.timestamps
    end
  end
end
