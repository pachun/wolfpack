class Game < ApplicationRecord
  validates :scheduled_at, :rink, :home_team, :away_team, presence: true
end
