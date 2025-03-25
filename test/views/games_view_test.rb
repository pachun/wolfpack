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
    assert_select ".game-list", /Wolfpack/
    assert_select ".game-list", /Opponent/
    assert_select ".game-list", /Score/
  end

  test "the game_list_item partial renders a single game (home team wins)" do
    game = create :game,
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      home_score: 2,
      away_score: 1

    render partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_includes rendered, "game-list-item-#{game.id}"
    assert_includes rendered, game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_includes rendered, "Rum Runners"
    assert_includes rendered, "Home"
    assert_includes rendered, "2 - 1 W"
  end

  test "the game_list_item partial renders a single game (home team losses)" do
    game = create :game,
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      home_score: 1,
      away_score: 2

    render partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_includes rendered, "game-list-item-#{game.id}"
    assert_includes rendered, game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_includes rendered, "Rum Runners"
    assert_includes rendered, "Home"
    assert_includes rendered, "1 - 2 L"
  end

  test "the game_list_item partial renders a single game (away team wins)" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners",
      away_score: 2,
      home_score: 1

    render partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_includes rendered, "game-list-item-#{game.id}"
    assert_includes rendered, game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_includes rendered, "Rum Runners"
    assert_includes rendered, "Away"
    assert_includes rendered, "2 - 1 W"
  end

  test "the game_list_item partial renders a single game (away team losses)" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners",
      away_score: 1,
      home_score: 2

    render partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_includes rendered, "game-list-item-#{game.id}"
    assert_includes rendered, game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_includes rendered, "Rum Runners"
    assert_includes rendered, "Away"
    assert_includes rendered, "1 - 2 L"
  end

  test "the game_list_item partial renders a single game (ties)" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners",
      away_score: 1,
      home_score: 1

    render partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_includes rendered, "game-list-item-#{game.id}"
    assert_includes rendered, game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_includes rendered, "Rum Runners"
    assert_includes rendered, "Away"
    assert_includes rendered, "1 - 1 T"
  end

  test "the game_list_item partial renders a single game (unplayed game)" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners"

    render partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_includes rendered, "game-list-item-#{game.id}"
    assert_includes rendered, game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_includes rendered, "Rum Runners"
    assert_includes rendered, "Away"
    assert_includes rendered, "Unplayed"
  end
end
