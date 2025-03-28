require "test_helper"

class IndexPlayersTest < ActionView::TestCase
  test "renders a Wolfpack Players header" do
    @players = []

    render template: "players/index"

    assert_includes rendered, "Wolfpack Players"
  end

  test "renders a link to create a new player" do
    @players = []

    render template: "players/index"

    assert_dom "a[href='#{new_player_path}']", text: /Create Player/i
  end
end
