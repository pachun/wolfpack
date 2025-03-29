require "test_helper"

class FlashMessageTest < ActionView::TestCase
  test "shows a flash notice" do
    flash[:notice] = "Hello, Flash Notice!"

    render partial: "shared/flash_message"

    assert_dom ".flash-message" do
      assert_dom ".bg-green-100", text: "Hello, Flash Notice!"
    end
  end

  test "shows a flash error" do
    flash[:error] = "Hello, Flash Error!"

    render partial: "shared/flash_message"

    assert_dom ".flash-message" do
      assert_dom ".bg-red-100", text: "Hello, Flash Error!"
    end
  end
end
