require "test_helper"

class FlashMessagePartialTest < ActionView::TestCase
  test "renders a flash notice" do
    flash[:notice] = "Hello, Flash Notice!"

    render partial: "shared/flash_message"

    assert_dom ".flash-message" do
      assert_dom ".bg-green-100", text: "Hello, Flash Notice!"
    end
  end

  test "renders a flash error" do
    flash[:error] = "Hello, Flash Error!"

    render partial: "shared/flash_message"

    assert_dom ".flash-message" do
      assert_dom ".bg-red-100", text: "Hello, Flash Error!"
    end
  end
end
