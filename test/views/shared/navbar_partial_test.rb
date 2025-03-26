require "test_helper"

class NavbarPartialTest < ActionView::TestCase
  test "renders a link to the games schedule" do
    render partial: "shared/navbar"

    assert_select "a[href='#{games_path}']", text: "Wolfpack Games"
  end
end
