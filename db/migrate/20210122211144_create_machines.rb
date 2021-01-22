class CreateMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :machines do |t|
      t.string :name
      t.string :notes
      t.belongs_to :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
