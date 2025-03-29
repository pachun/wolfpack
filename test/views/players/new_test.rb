require "test_helper"

class PlayersNewTest < ActionView::TestCase
  test "shows a new player header" do
    @player = build :player

    render template: "players/new"

    assert_includes rendered, "New Player"
  end
end
