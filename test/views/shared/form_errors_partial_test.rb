require "test_helper"

class FormErrorsPartialTest < ActionView::TestCase
  test "renders nothing when there are no errors" do
    game = create :game

    render partial: "shared/form_errors", locals: { model: game }

    refute_includes rendered, ".game-form-errors-#{game.id}"
  end

  test "renders errors when present" do
    game = build :game, home_team: "", away_team: ""
    game.validate

    render partial: "shared/form_errors", locals: { model: game }

    assert_select ".game-form-errors-new-game" do
      assert_select "h2", text: "2 errors prevented this game from being saved:"
      assert_select "ul li", text: "Home team can't be blank"
      assert_select "ul li", text: "Away team can't be blank"
    end
  end
end
