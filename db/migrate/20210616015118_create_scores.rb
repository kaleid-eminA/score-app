class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.references :user,        foreign_key: true
      t.integer :score
      t.integer :score_avg
      t.timestamps
    end
  end
end
