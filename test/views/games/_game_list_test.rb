require "test_helper"

class GameListPartialTest < ActionView::TestCase
  test "renders a list of games" do
    game_1 = create :game
    game_2 = create :game

    render partial: "games/game_list", locals: { games: [ game_1, game_2 ] }

    assert_dom ".game-list" do
      assert_dom ".game-list-item-#{game_1.id}"
      assert_dom ".game-list-item-#{game_2.id}"
    end

    assert_select ".game-list", /Time/
    assert_select ".game-list", /Rink/
    assert_select ".game-list", /Wolfpack/
    assert_select ".game-list", /Opponent/
    assert_select ".game-list", /Score/
  end
end
