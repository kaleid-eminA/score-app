class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.references :user,        foreign_key: true
      t.decimal :score, :precision => 4, :scale => 1,          null: false
      t.decimal :score_avg, :precision => 3, :scale => 1
      t.timestamps
    end
  end
end
