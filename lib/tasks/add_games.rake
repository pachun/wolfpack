desc "Add games to the database"
task add_games: :environment do
  Game.create!(
    rink: "D",
    scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 1, 20, 22, 30, 0),
    away_team: "Wolfpack",
    away_score: 6,
    home_team: "Rum Runners",
    home_score: 1,
  )
  Game.create!(
    rink: "B",
    scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 1, 27, 21, 30, 0),
    away_team: "Wolfpack",
    away_score: 8,
    home_team: "Pasco Fire",
    home_score: 0,
  )
  Game.create!(
    rink: "A",
    scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 2, 3, 21, 00, 0),
    away_team: "Wolfpack",
    away_score: 5,
    home_team: "Pasco Fire",
    home_score: 3,
  )
  Game.create!(
    rink: "C",
    scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 2, 10, 21, 45, 0),
    away_team: "Hillsborough Heat",
    away_score: 0,
    home_team: "Wolfpack",
    home_score: 5,
  )
  Game.create!(
    rink: "A",
    scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 2, 17, 22, 15, 0),
    away_team: "Wolfpack",
    away_score: 3,
    home_team: "Chicarones",
    home_score: 6,
  )
  Game.create!(
    rink: "C",
    scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 2, 24, 21, 45, 0),
    away_team: "Benders",
    away_score: 0,
    home_team: "Wolfpack",
    home_score: 4,
  )
  Game.create!(
    rink: "D",
    scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 3, 3, 20, 0, 0),
    away_team: "Wolfpack",
    away_score: 6,
    home_team: "Benders",
    home_score: 2,
  )
  Game.create!(
    rink: "B",
    scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 3, 10, 21, 30, 0),
    away_team: "Pub Subs",
    away_score: 3,
    home_team: "Wolfpack",
    home_score: 4,
  )
  Game.create!(
    rink: "D",
    scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 3, 17, 22, 30, 0),
    away_team: "Whiskey Dekes",
    away_score: 3,
    home_team: "Wolfpack",
    home_score: 2,
  )
  Game.create!(
    rink: "B",
    scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 3, 24, 21, 30, 0),
    away_team: "Chicharones",
    home_team: "Wolfpack",
  )
end
