require "test_helper"

class PlayersShowTest < ActionView::TestCase
  test "shows player details" do
    @player = create :player,
      first_name: "Kevin",
      last_name: "Malone"

    render template: "players/show"

    assert_dom ".player-details-#{@player.id}" do
      assert_dom "h1", text: "Kevin Malone"
    end
  end

  test "shows a link to edit the player" do
    @player = create :player

    render template: "players/show"

    assert_select "a[href='#{edit_player_path(@player)}']", text: "Edit"
  end

  test "shows a link to delete the player" do
    @player = create :player

    render template: "players/show"

    assert_select "form.button_to[method='post'][action='#{player_path(@player)}']" do
      assert_select "input[name='_method'][value='delete']"
      assert_select "button[data-confirm='Are you sure you want to delete this player?']", text: "Delete"
    end
  end

  test "shows a link to add a new player" do
    @player = create :player

    render template: "players/show"

    assert_select "a[href='#{new_player_path(@player)}']", text: "Add New Player"
  end
end
