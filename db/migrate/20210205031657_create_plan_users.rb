class CreatePlanUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_users do |t|
      t.date :purchase_date
      t.boolean :referral, default: false
      t.belongs_to :plan, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
