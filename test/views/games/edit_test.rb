require "test_helper"

class GamesEditTest < ActionView::TestCase
  test "displays team name titles" do
    @game = Game.new(home_team: "Wolves", away_team: "Sharks")

    render template: "games/edit"

    assert_includes rendered, "Edit Sharks @ Wolves"
  end

  test "uses previous team names when edited to have an empty team name" do
    @game = Game.new(home_team: "", away_team: "")
    @game.define_singleton_method(:home_team_was) { "Wolves" }
    @game.define_singleton_method(:away_team_was) { "Sharks" }

    render template: "games/edit"

    assert_includes rendered, "Edit Sharks @ Wolves"
  end
end
