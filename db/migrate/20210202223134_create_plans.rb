class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.string :description
      t.integer :status, default: 0
      t.integer :price
      t.integer :difficulty, default: 0

      t.timestamps
    end
  end
end
