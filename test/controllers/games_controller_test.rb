require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "index renders a list of games" do
    game = Game.create!(
      rink: "D",
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 1, 20, 22, 30, 0),
      home_score: 6,
      away_score: 1,
    )

    get games_url

    assert_response :success

    assert_dom "h1", "Games"
    assert_dom ".game-list"
  end
end
