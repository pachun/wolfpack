require "test_helper"

class NavbarTest < ActionView::TestCase
  test "renders a link to the games schedule" do
    render partial: "shared/navbar"

    assert_select "a[href='#{games_path}']", text: "Wolfpack Games"
  end

  test "renders a link to the players list" do
    render partial: "shared/navbar"

    assert_select "a[href='#{players_path}']", text: "Wolfpack Players"
  end
end
