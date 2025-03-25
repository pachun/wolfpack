require "test_helper"

class GamesViewTest < ActionView::TestCase
  test "the game_list partial renders a list of games" do
    # should use factories
    game_1 = Game.create!(
      rink: "D",
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 1, 20, 22, 30, 0),
      home_score: 6,
      away_score: 1,
    )
    game_2 = Game.create!(
      rink: "D",
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 1, 20, 22, 30, 0),
      home_score: 6,
      away_score: 1,
    )

    render partial: "games/game_list", locals: { games: [ game_1, game_2 ] }

    assert_dom ".game-list" do
      assert_dom ".game-list-item-#{game_1.id}"
      assert_dom ".game-list-item-#{game_2.id}"
    end
  end

  test "the game_list_item partial renders a single game" do
    # should use factories
    game = Game.create!(
      rink: "D",
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 1, 20, 22, 30, 0),
      home_score: 6,
      away_score: 1,
    )

    render partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_includes rendered, "game-list-item-#{game.id}"

    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']",
      text: game.scheduled_at.in_time_zone("Eastern Time (US & Canada)").to_formatted_s(:short)
    assert_includes rendered, game.rink
    assert_includes rendered, game.home_team
    assert_includes rendered, game.away_team
    assert_includes rendered, game.home_score.to_s
    assert_includes rendered, game.away_score.to_s
    assert_dom "a[href='#{edit_game_path(game)}']", text: "Edit"
  end
end
