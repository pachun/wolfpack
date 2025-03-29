require "test_helper"

class NavbarTest < ActionView::TestCase
  test "shows a link to the games schedule" do
    render partial: "shared/navbar"

    assert_select "a[href='#{games_path}']", text: "Games"
  end

  test "shows a link to the players list" do
    render partial: "shared/navbar"

    assert_select "a[href='#{players_path}']", text: "Players"
  end
end
