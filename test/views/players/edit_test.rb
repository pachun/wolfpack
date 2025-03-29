require "test_helper"

class PlayersEditTest < ActionView::TestCase
  test "displays player names" do
    @player = Player.new(first_name: "Jim", last_name: "Halpert")

    render template: "players/edit"

    assert_dom "h1", "Edit Jim Halpert"
  end

  test "uses previous team names when edited to have an empty team name" do
    @player = Player.new(first_name: "", last_name: "")
    @player.define_singleton_method(:first_name_was) { "Michael" }
    @player.define_singleton_method(:last_name_was) { "Scott" }

    render template: "players/edit"

    assert_includes rendered, "Edit Michael Scott"
  end
end
