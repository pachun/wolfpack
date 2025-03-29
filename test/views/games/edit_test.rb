require "test_helper"

class GamesEditTest < ActionView::TestCase
  test "displays team name titles" do
    @game = Game.new(id: 1, home_team: "Wolves", away_team: "Sharks", scheduled_at: Time.current)

    render template: "games/edit"

    assert_includes rendered, "Edit Sharks @ Wolves"
  end

  test "uses previous team names when edited to have an empty team name" do
    @game = Game.new(id: 1, home_team: "", away_team: "", scheduled_at: Time.current)
    @game.define_singleton_method(:home_team_was) { "Wolves" }
    @game.define_singleton_method(:away_team_was) { "Sharks" }

    render template: "games/edit"

    assert_includes rendered, "Edit Sharks @ Wolves"
  end
end
