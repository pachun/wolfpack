require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "index shows a list of teams" do
    team_1 = create :team
    team_2 = create :team

    get teams_path

    assert_response :success

    assert_dom ".team-list" do
      assert_dom ".team-list-item-#{team_1.id}"
      assert_dom ".team-list-item-#{team_2.id}"
    end
  end

  # test "show shows a single player" do
  #   player = create :player
  #
  #   get player_path(player)
  #
  #   assert_response :success
  #
  #   assert_dom ".player-details-#{player.id}"
  # end
  #
  # test "edit shows an editable form" do
  #   player = create :player
  #
  #   get edit_player_path(player)
  #
  #   assert_response :success
  #
  #   assert_dom ".player-form-#{player.id}"
  # end
  #
  # test "update saves all player attributes" do
  #   player = create :player
  #
  #   patch player_path(player), params: { player: {
  #     first_name: "John",
  #     last_name: "Cena",
  #   } }
  #
  #   assert_redirected_to player_path(player)
  #
  #   follow_redirect!
  #
  #   assert_equal "Updated John Cena", flash[:notice]
  #
  #   player.reload
  #
  #   assert_equal "John", player.first_name
  #   assert_equal "Cena", player.last_name
  # end
  #
  # test "update displays form errors when present" do
  #   player = create :player, first_name: "Kevin"
  #
  #   patch player_path(player), params: { player: { first_name: "" } }
  #
  #   assert_response :unprocessable_entity
  #
  #   player.reload
  #
  #   assert_equal "Kevin", player.first_name
  #
  #   assert_dom ".player-form-errors-#{player.id}"
  # end
  #
  # test "new shows a form" do
  #   player = build :player
  #
  #   get new_player_path
  #
  #   assert_dom ".player-form-new"
  # end
  #
  # test "create saves a new player" do
  #   post players_path, params: { player: {
  #     first_name: "John",
  #     last_name: "Cena",
  #   } }
  #
  #   player = Player.last
  #
  #   assert_equal "Created John Cena", flash[:notice]
  #   assert_redirected_to player_path(player)
  # end
  #
  # test "create displays form errors when present" do
  #   post players_path, params: { player: {
  #     first_name: "",
  #     last_name: "",
  #   } }
  #
  #   assert_response :unprocessable_entity
  #   assert_dom ".player-form-errors-new"
  # end
  #
  # test "destroy removes a player" do
  #   player = create :player,
  #     first_name: "Kevin",
  #     last_name: "Malone"
  #
  #   delete player_path(player)
  #
  #   assert_redirected_to players_path
  #   assert_nil Player.find_by(id: player.id)
  #   assert_equal "Deleted Kevin Malone", flash[:notice]
  # end
end
