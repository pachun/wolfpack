class AddNotNullConstraintsToGames < ActiveRecord::Migration[8.0]
  def change
    change_column_null :games, :scheduled_at, false
    change_column_null :games, :rink, false
    change_column_null :games, :home_team, false
    change_column_null :games, :away_team, false
  end
end
