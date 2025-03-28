require "test_helper"

class GameFormPartialTest < ActionView::TestCase
  test "renders a game form" do
    game = create :game

    render partial: "games/form", locals: { game: game }

    # Form element
    assert_select "form[action='#{game_path(game)}'][method='post']"

    # Scheduled At
    assert_select "label[for='game_scheduled_at']", text: /Scheduled At/i
    assert_select "input[type='datetime-local'][name='game[scheduled_at]']"

    # Home Team
    assert_select "label[for='game_home_team']", text: /Home Team/i
    assert_select "input[type='text'][name='game[home_team]']"

    # Away Team
    assert_select "label[for='game_away_team']", text: /Away Team/i
    assert_select "input[type='text'][name='game[away_team]']"

    # Home Score
    assert_select "label[for='game_home_score']", text: /Home Score/i
    assert_select "input[type='number'][name='game[home_score]']"

    # Away Score
    assert_select "label[for='game_away_score']", text: /Away Score/i
    assert_select "input[type='number'][name='game[away_score]']"

    # Rink
    assert_select "label[for='game_rink']", text: /Rink/i
    assert_select "select[name='game[rink]']" do
      assert_select "option", text: "A"
      assert_select "option", text: "B"
      assert_select "option", text: "C"
      assert_select "option", text: "D"
    end

    # Submit button
    assert_select "input[type='submit'],button[type='submit']"
  end

  test "shows a cancel link to go back to the game show screen" do
    game = create :game

    render partial: "games/form", locals: { game: game }

    assert_select "a[href='#{game_path(game)}']", text: /Cancel/i
  end

  test "shows a cancel link to go back to the games index screen" do
    game = build :game

    render partial: "games/form", locals: { game: game }

    assert_select "a[href='#{games_path}']", text: /Cancel/i
  end
end
