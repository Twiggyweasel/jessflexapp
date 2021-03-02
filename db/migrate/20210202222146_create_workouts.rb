class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :title, null: false
      t.string :description

      t.integer :duration, default: 10

      t.integer :difficulty, default: 0
      t.integer :status, default: 0
      
      t.timestamps
    end
  end
end
