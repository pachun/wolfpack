require "test_helper"

class PlayerListItemPartialTest < ActionView::TestCase
  include Rails.application.routes.url_helpers

  test "clicking a player shows the player details" do
    player = create :player

    render_in_table partial: "players/player_list_item", locals: { player: player, is_last_row: true }

    assert_dom "tr[data-controller='clickable-row'][data-action='click->clickable-row#navigate'][data-clickable-row-url-value='#{player_path(player)}']"
  end

  test "renders player names" do
    player = create :player,
      first_name: "Jim",
      last_name: "Halpert"

    render_in_table partial: "players/player_list_item", locals: { player: player, is_last_row: true }

    assert_dom ".player-list-item-#{player.id}"
    assert_dom "td", text: "#{player.first_name} #{player.last_name}"
  end
end
