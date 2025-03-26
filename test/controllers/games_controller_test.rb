require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "index renders a list of games" do
    game_1 = create :game
    game_2 = create :game

    get games_path

    assert_response :success

    assert_dom "h1", "Wolfpack Games"
    assert_dom ".game-list" do
      assert_dom ".game-list-item-#{game_1.id}"
      assert_dom ".game-list-item-#{game_2.id}"
    end
  end

  test "show renders a single game" do
    game = create :game,
      rink: "D",
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 1, 20, 22, 30, 0),
      home_score: 6,
      away_score: 1

    get game_path(game)

    assert_response :success

    assert_dom ".game-details-#{game.id}"
  end
end
