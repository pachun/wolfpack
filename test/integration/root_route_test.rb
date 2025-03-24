require "test_helper"

class GamesRoutesTest < ActionDispatch::IntegrationTest
  test "root routes to games#index" do
    assert_routing "/", controller: "games", action: "index"
  end
end
