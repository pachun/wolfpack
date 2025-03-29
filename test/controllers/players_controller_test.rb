require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "index shows a list of players" do
    player_1 = create :player
    player_2 = create :player

    get players_path

    assert_response :success

    assert_dom ".player-list" do
      assert_dom ".player-list-item-#{player_1.id}"
      assert_dom ".player-list-item-#{player_2.id}"
    end
  end

  test "show shows a single player" do
    player = create :player

    get player_path(player)

    assert_response :success

    assert_dom ".player-details-#{player.id}"
  end

  test "edit shows an editable form" do
    player = create :player

    get edit_player_path(player)

    assert_response :success

    assert_dom ".player-form-#{player.id}"
  end

  test "update saves all player attributes" do
    player = create :player

    patch player_path(player), params: { player: {
      first_name: "John",
      last_name: "Cena",
    } }

    assert_redirected_to player_path(player)

    follow_redirect!

    assert_equal "Updated John Cena", flash[:notice]

    player.reload

    assert_equal "John", player.first_name
    assert_equal "Cena", player.last_name
  end

  test "update displays form errors when present" do
    player = create :player, first_name: "Kevin"

    patch player_path(player), params: { player: { first_name: "" } }

    assert_response :unprocessable_entity

    player.reload

    assert_equal "Kevin", player.first_name

    assert_dom ".player-form-errors-#{player.id}"
  end

  test "new shows a form" do
    player = build :player

    get new_player_path

    assert_dom ".player-form-new"
  end

  test "create saves a new player" do
    post players_path, params: { player: {
      first_name: "John",
      last_name: "Cena",
    } }

    player = Player.last

    assert_redirected_to player_path(player)
  end

  test "create displays form errors when present" do
    post players_path, params: { player: {
      first_name: "",
      last_name: "",
    } }

    assert_response :unprocessable_entity
    assert_dom ".player-form-errors-new"
  end

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
