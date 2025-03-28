require "test_helper"

class GameListItemPartialTest < ActionView::TestCase
  include Rails.application.routes.url_helpers

  test "clicking a game shows the game details" do
    game = create :game

    render_in_table partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_dom "tr[data-controller='clickable-row'][data-action='click->clickable-row#navigate'][data-clickable-row-url-value='#{game_path(game)}']"
  end

  test "renders home team wins" do
    game = create :game,
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      home_score: 2,
      away_score: 1

    render_in_table partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_dom ".game-list-item-#{game.id}"
    assert_dom "td", text: game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_dom "td", text: "Rum Runners"
    assert_dom "td", text: "Home"
    assert_dom "td", text: "2 - 1 W"
  end

  test "renders home team losses" do
    game = create :game,
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      home_score: 1,
      away_score: 2

    render_in_table partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_dom ".game-list-item-#{game.id}"
    assert_dom "td", text: game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_dom "td", text: "Rum Runners"
    assert_dom "td", text: "Home"
    assert_dom "td", text: "1 - 2 L"
  end

  test "renders away team wins" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners",
      away_score: 2,
      home_score: 1

    render_in_table partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_dom ".game-list-item-#{game.id}"
    assert_dom "td", text: game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_dom "td", text: "Rum Runners"
    assert_dom "td", text: "Away"
    assert_dom "td", text: "2 - 1 W"
  end

  test "renders away team losses" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners",
      away_score: 1,
      home_score: 2

    render_in_table partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_dom ".game-list-item-#{game.id}"
    assert_dom "td", text: game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_dom "td", text: "Rum Runners"
    assert_dom "td", text: "Away"
    assert_dom "td", text: "1 - 2 L"
  end

  test "renders ties" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners",
      away_score: 1,
      home_score: 1

    render_in_table partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_dom ".game-list-item-#{game.id}"
    assert_dom "td", text: game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_dom "td", text: "Rum Runners"
    assert_dom "td", text: "Away"
    assert_dom "td", text: "1 - 1 T"
  end

  test "renders unplayed games" do
    game = create :game,
      away_team: "Wolfpack",
      home_team: "Rum Runners"

    render_in_table partial: "games/game_list_item", locals: { game: game, is_last_row: true }

    assert_dom ".game-list-item-#{game.id}"
    assert_dom "td", text: game.rink
    assert_dom "time[datetime='#{game.scheduled_at.iso8601}']"
    assert_dom "td", text: "Rum Runners"
    assert_dom "td", text: "Away"
    assert_dom "td", text: "Unplayed"
  end

  private

  def render_in_table(partial:, locals: {})
    locals_assignments = locals.map { |k, _| "#{k}: #{k}" }.join(", ")

    render inline: <<~ERB, locals: locals
      <table>
        <%= render partial: "#{partial}", locals: { #{locals_assignments} } %>
      </table>
    ERB
  end
end
