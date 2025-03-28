require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "index renders a list of players" do
    player_1 = create :player
    player_2 = create :player

    get players_path

    assert_response :success

    assert_dom "h1", "Wolfpack Players"
    assert_dom ".player-list" do
      assert_dom ".player-list-item-#{player_1.id}"
      assert_dom ".player-list-item-#{player_2.id}"
    end
  end

  # test "show renders a single game" do
  #   game = create :game
  #
  #   get game_path(game)
  #
  #   assert_response :success
  #
  #   assert_dom ".game-details-#{game.id}"
  # end
  #
  # test "edit renders an editable form" do
  #   game = create :game
  #
  #   get edit_game_path(game)
  #
  #   assert_response :success
  #
  #   assert_dom "h1", "Edit #{game.away_team} @ #{game.home_team}"
  #   assert_dom ".game-form-#{game.id}"
  # end
  #
  # test "update saves all game attributes" do
  #   game = create :game
  #
  #   patch game_path(game), params: { game: {
  #     rink: "B",
  #     home_team: "Wolves",
  #     away_team: "Sharks",
  #     home_score: 4,
  #     away_score: 5,
  #     scheduled_at: "2025-03-01T20:45",
  #   } }
  #
  #   assert_redirected_to game_path(game)
  #
  #   follow_redirect!
  #
  #   assert_equal "Updated Sharks @ Wolves", flash[:notice]
  #
  #   game.reload
  #
  #   assert_equal "B", game.rink
  #   assert_equal "Wolves", game.home_team
  #   assert_equal "Sharks", game.away_team
  #   assert_equal 4, game.home_score
  #   assert_equal 5, game.away_score
  #   assert_equal Time.utc(2025, 3, 1, 20, 45), game.scheduled_at
  # end
  #
  # test "update displays form errors when present" do
  #   game = create :game, home_team: "Wolves"
  #
  #   patch game_path(game), params: { game: { home_team: "" } }
  #
  #   assert_response :unprocessable_entity
  #
  #   game.reload
  #
  #   assert_equal "Wolves", game.home_team
  #
  #   assert_dom ".game-form-errors-#{game.id}"
  # end
  #
  # test "new renders a form" do
  #   game = build :game
  #
  #   get new_game_path
  #
  #   assert_dom "h1", "New Game"
  #   assert_dom ".game-form-new-game"
  # end
  #
  # test "create saves a new game" do
  #   post games_path, params: { game: {
  #     rink: "B",
  #     home_team: "Wolves",
  #     away_team: "Sharks",
  #     home_score: 4,
  #     away_score: 5,
  #     scheduled_at: "2025-03-01T20:45",
  #   } }
  #
  #   game = Game.last
  #
  #   assert_redirected_to game_path(game)
  # end
  #
  # test "create displays form errors when present" do
  #   post games_path, params: { game: {
  #     rink: "B",
  #     home_team: "",
  #     away_team: "",
  #     home_score: 4,
  #     away_score: 5,
  #     scheduled_at: "2025-03-01T20:45",
  #   } }
  #
  #   assert_response :unprocessable_entity
  #   assert_dom ".game-form-errors-new-game"
  # end
  #
  # test "destroy removes a game" do
  #   game = create :game,
  #     away_team: "Sharks",
  #     home_team: "Wolves"
  #
  #   delete game_path(game)
  #
  #   assert_redirected_to games_path
  #   assert_nil Game.find_by(id: game.id)
  #   assert_equal "Deleted Sharks @ Wolves", flash[:notice]
  # end
end
