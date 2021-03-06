class CreateWorkoutExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_exercises do |t|
      t.integer :difficulty

      t.belongs_to :workout, null: false, foreign_key: true
      t.belongs_to :exercise, null: false, foreign_key: true
      t.belongs_to :variation, null: false, foreign_key: true
      t.belongs_to :series, null: false, foreign_key: true

      t.timestamps
    end
  end
end
