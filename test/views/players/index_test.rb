require "test_helper"

class PlayersIndexTest < ActionView::TestCase
  test "renders a Wolfpack Players header" do
    @players = []

    render template: "players/index"

    assert_dom "h1", text: "Wolfpack Players"
  end

  test "renders a link to create a new player" do
    @players = []

    render template: "players/index"

    assert_dom "a[href='#{new_player_path}']", text: /Create Player/i
  end

  test "renders a list of players" do
    player_1 = create :player
    player_2 = create :player

    render partial: "players/player_list", locals: { players: [ player_1, player_2 ] }

    assert_dom ".player-list" do
      assert_select "th", text: "Name"

      assert_dom ".player-list-item-#{player_1.id}" do
        assert_dom "td", text: "#{player_1.first_name} #{player_1.last_name}"
      end
      assert_dom ".player-list-item-#{player_2.id}" do
        assert_dom "td", text: "#{player_2.first_name} #{player_2.last_name}"
      end
    end
  end

  test "clicking a player shows the player details" do
    player = create :player

    @players = [ player ]

    render template: "players/index"

    data_controller = "data-controller='clickable-row'"
    data_action = "data-action='click->clickable-row#navigate'"
    data_clickable_row_url_value = "data-clickable-row-url-value='#{player_path(player)}'"

    assert_dom ".player-list-item-#{player.id}" do
      assert_dom "tr[#{data_controller}][#{data_action}][#{data_clickable_row_url_value}]"
    end
  end
end
