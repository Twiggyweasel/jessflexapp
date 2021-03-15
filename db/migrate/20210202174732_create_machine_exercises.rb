class CreateMachineExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :machine_exercises do |t|
      t.belongs_to :machine, null: false, foreign_key: true
      t.belongs_to :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
