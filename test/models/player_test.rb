require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  test "requires first_name and last_name" do
    player = Player.new

    assert_not player.valid?, "Player should be invalid without required attributes"
    assert_includes player.errors[:first_name], "can't be blank"
    assert_includes player.errors[:last_name], "can't be blank"
  end
end
