class CreatePlanWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_workouts do |t|
      t.boolean :previewable, default: false

      t.belongs_to :plan, null: false, foreign_key: true
      t.belongs_to :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
