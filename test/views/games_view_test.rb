require "test_helper"

class GamesViewTest < ActionView::TestCase
  test "the game_list partial renders a list of games" do
    game_1 = create :game
    game_2 = create :game

    render partial: "games/game_list", locals: { games: [ game_1, game_2 ] }

    assert_dom ".game-list" do
      assert_dom ".game-list-item-#{game_1.id}"
      assert_dom ".game-list-item-#{game_2.id}"
    end

    assert_select ".game-list", /Time/
    assert_select ".game-list", /Rink/
    assert_select ".game-list", /Home Team/
    assert_select ".game-list", /Away Team/
    assert_select ".game-list", /Home Score/
    assert_select ".game-list", /Away Score/
  end

  test "the game_list_item partial renders a single game" do
    game = create :game, home_score: 2, away_score: 1

    render partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_includes rendered, "game-list-item-#{game.id}"
    assert_includes rendered, game.rink
    assert_includes rendered, game.home_team
    assert_includes rendered, game.away_team
    assert_includes rendered, game.home_score.to_s
    assert_includes rendered, game.away_score.to_s
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    # assert_dom "a[href='#{edit_game_path(game)}']", text: "Edit"
  end
end
