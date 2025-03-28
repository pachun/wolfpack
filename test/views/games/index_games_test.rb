require "test_helper"

class IndexGamesTest < ActionView::TestCase
  test "renders a Wolfpack Games header" do
    @games = []

    render template: "games/index"

    assert_includes rendered, "Wolfpack Games"
  end

  test "renders a link to create a new game" do
    @games = []

    render template: "games/index"

    assert_dom "a[href='#{new_game_path}']", text: /Create Game/i
  end

  test "renders a list of games" do
    game_1 = create :game
    game_2 = create :game
    @games = [ game_1, game_2 ]

    render template: "games/index"

    assert_dom ".game-list" do
      assert_select "th", text: "Time"
      assert_select "th", text: "Rink"
      assert_select "th", text: "Wolfpack"
      assert_select "th", text: "Opponent"
      assert_select "th", text: "Score"

      assert_dom ".game-list-item-#{game_1.id}"
      assert_dom ".game-list-item-#{game_2.id}"
    end
  end

  test "shows game details when a game is clicked" do
    game = create :game

    @games = [ game ]

    render template: "games/index"

    assert_dom "tr[data-controller='clickable-row'][data-action='click->clickable-row#navigate'][data-clickable-row-url-value='#{game_path(game)}']"
  end

  test "renders home team wins" do
    game = create :game,
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      home_score: 2,
      away_score: 1

    @games = [ game ]

    render template: "games/index"

    assert_dom ".game-list-item-#{game.id}" do
      assert_dom "td", text: game.rink
      assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
      assert_dom "td", text: "Rum Runners"
      assert_dom "td", text: "Home"
      assert_dom "td", text: "2 - 1 W"
    end
  end

  test "renders home team losses" do
    game = create :game,
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      home_score: 1,
      away_score: 2

    @games = [ game ]

    render template: "games/index"

    assert_dom ".game-list-item-#{game.id}" do
      assert_dom "td", text: game.rink
      assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
      assert_dom "td", text: "Rum Runners"
      assert_dom "td", text: "Home"
      assert_dom "td", text: "1 - 2 L"
    end
  end

  test "renders away team wins" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners",
      away_score: 2,
      home_score: 1

    @games = [ game ]

    render template: "games/index"

    assert_dom ".game-list-item-#{game.id}" do
      assert_dom "td", text: game.rink
      assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
      assert_dom "td", text: "Rum Runners"
      assert_dom "td", text: "Away"
      assert_dom "td", text: "2 - 1 W"
    end
  end

  test "renders away team losses" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners",
      away_score: 1,
      home_score: 2

    @games = [ game ]

    render template: "games/index"

    assert_dom ".game-list-item-#{game.id}" do
      assert_dom "td", text: game.rink
      assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
      assert_dom "td", text: "Rum Runners"
      assert_dom "td", text: "Away"
      assert_dom "td", text: "1 - 2 W"
    end
  end

  test "renders ties" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners",
      away_score: 1,
      home_score: 1

    @games = [ game ]

    render template: "games/index"

    assert_dom ".game-list-item-#{game.id}" do
      assert_dom "td", text: game.rink
      assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
      assert_dom "td", text: "Rum Runners"
      assert_dom "td", text: "Away"
      assert_dom "td", text: "1 - 1 T"
    end
  end

  test "renders unplayed games" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners"

    @games = [ game ]

    render template: "games/index"

    assert_dom ".game-list-item-#{game.id}" do
      assert_dom "td", text: game.rink
      assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
      assert_dom "td", text: "Rum Runners"
      assert_dom "td", text: "Away"
      assert_dom "td", text: "Unplayed"
    end
  end
end
