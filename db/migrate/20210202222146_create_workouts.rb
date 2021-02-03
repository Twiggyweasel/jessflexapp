class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
