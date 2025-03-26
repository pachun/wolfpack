require "test_helper"

class ApplicationLayoutTest < ActionView::TestCase
  test "renders a navigation bar" do
    render inline: "<p>Yield Content</p>", layout: "layouts/application"

    assert_dom ".navbar"
  end

  test "renders flash messages" do
    flash[:notice] = "Hello, Flash!"

    render inline: "<p>Yield Content</p>", layout: "layouts/application"

    assert_dom ".flash-message"
  end
end
