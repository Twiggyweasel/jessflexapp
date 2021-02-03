class CreateWorkoutActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_activities do |t|
      t.belongs_to :workout, null: false, foreign_key: true
      t.belongs_to :activity_variation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
