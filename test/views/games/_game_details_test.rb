require "test_helper"

class GameDetailsPartialTest < ActionView::TestCase
  test "shows game details" do
    game = create :game,
      home_team: "Wolfpack",
      away_team: "Pork Chop Express",
      home_score: 3,
      away_score: 1

    render partial: "games/game_details", locals: { game: game }

    assert_dom ".game-details-#{game.id}" do
      assert_dom ".away-team" do
        assert_dom "h1", text: "Pork Chop Express"
        assert_dom "div", text: "1"
      end

      assert_dom ".home-team" do
        assert_dom "h1", text: "Wolfpack"
        assert_dom "div", text: "3"
      end

      assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
      assert_dom "div", text: "Rink #{game.rink}"
    end
  end

  test "shows a link to edit the game" do
    game = create :game

    render partial: "games/game_details", locals: { game: game }

    assert_select "a[href='#{edit_game_path(game)}']", text: "Edit"
  end

  test "shows a link to delete the game" do
    game = create :game

    render partial: "games/game_details", locals: { game: game }

    href = "href='#{game_path(game)}'"
    data_method = "data-method='delete'"
    data_confirm = "data-confirm='Are you sure you want to delete this game?'"

    assert_select "form.button_to[method='post'][action='#{game_path(game)}']" do
      assert_select "input[name='_method'][value='delete']"
      assert_select "button[data-confirm='Are you sure you want to delete this game?']", text: "Delete"
    end
  end
end
