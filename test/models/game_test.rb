require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "requires scheduled_at, rink, home_team, and away_team" do
    game = Game.new

    assert_not game.valid?, "Game should be invalid without required attributes"
    assert_includes game.errors[:scheduled_at], "can't be blank"
    assert_includes game.errors[:rink], "can't be blank"
    assert_includes game.errors[:home_team], "can't be blank"
    assert_includes game.errors[:away_team], "can't be blank"
  end
end
