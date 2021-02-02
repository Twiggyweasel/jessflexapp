class CreateMachineActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :machine_activities do |t|
      t.belongs_to :machine, null: false, foreign_key: true
      t.belongs_to :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
