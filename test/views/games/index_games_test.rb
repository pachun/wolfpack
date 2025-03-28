require "test_helper"

class IndexGamesTest < ActionView::TestCase
  test "renders a Wolfpack Games header" do
    @games = []

    render template: "games/index"

    assert_includes rendered, "Wolfpack Games"
  end

  test "renders a link to create a new game" do
    @games = []

    render template: "games/index"

    assert_dom "a[href='#{new_game_path}']", text: /Create Game/i
  end
end
