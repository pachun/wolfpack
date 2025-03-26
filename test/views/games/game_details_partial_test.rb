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
end
