class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :description

     
      t.boolean :bundle_only, default: true 
      t.integer :status
      t.timestamps
    end
  end
end
