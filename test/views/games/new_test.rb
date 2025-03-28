require "test_helper"

class GamesNewTest < ActionView::TestCase
  test "shows a new game header" do
    @game = build :game

    render template: "games/new"

    assert_includes rendered, "New Game"
  end
end
