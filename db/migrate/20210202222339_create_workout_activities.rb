class CreateWorkoutActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_activities do |t|
      t.integer :difficulty

      t.belongs_to :workout, null: false, foreign_key: true
      t.belongs_to :activity, null: false, foreign_key: true
      t.belongs_to :variation, null: false, foreign_key: true
      t.belongs_to :series, null: false, foreign_key: true

      t.timestamps
    end
  end
end
