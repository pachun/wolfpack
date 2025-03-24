require "application_system_test_case"

class ViewingGamesTest < ApplicationSystemTestCase
  test "visiting /games" do
    game = Game.create!(
      rink: "D",
      home_team: "Wolfpack",
      away_team: "Rum Runners",
      scheduled_at: Time.find_zone("Eastern Time (US & Canada)").local(2025, 1, 20, 22, 30, 0),
      home_score: 6,
      away_score: 1,
    )

    visit games_url

    assert_selector "h1", text: "Games"

    within "table thead" do
      assert_selector "th", text: "Time"
      assert_selector "th", text: "Rink"
      assert_selector "th", text: "Home Team"
      assert_selector "th", text: "Home Score"
      assert_selector "th", text: "Away Score"
      assert_selector "th", text: "Away Team"
    end

    within "table tbody" do
      assert_selector "time[datetime='#{game.scheduled_at.iso8601}']",
        text: game.scheduled_at.in_time_zone("Eastern Time (US & Canada)").to_formatted_s(:short)
      assert_text "D"
      assert_text "Wolfpack"
      assert_text "Rum Runners"
      assert_text "6"
      assert_text "1"
    end
  end
end
