class CreateChallengeSets < ActiveRecord::Migration[6.1]
  def change
    create_table :challenge_sets do |t|
      t.int :order
      t.belongs_to :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
