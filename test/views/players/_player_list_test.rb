require "test_helper"

class PlayerListPartialTest < ActionView::TestCase
  test "renders a list of players" do
    player_1 = create :player
    player_2 = create :player

    render partial: "players/player_list", locals: { players: [ player_1, player_2 ] }

    assert_dom ".player-list" do
      assert_dom ".player-list-item-#{player_1.id}"
      assert_dom ".player-list-item-#{player_2.id}"
    end

    assert_select ".player-list", /Name/
  end
end
