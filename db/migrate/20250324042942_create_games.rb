class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.datetime :scheduled_at
      t.string :home_team
      t.string :away_team
      t.integer :home_score
      t.integer :away_score
      t.string :rink

      t.timestamps
    end
  end
end
