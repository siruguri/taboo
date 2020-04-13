require "application_system_test_case"

class GameV2sTest < ApplicationSystemTestCase
  setup do
    @game_v2 = game_v2s(:one)
  end

  test "visiting the index" do
    visit game_v2s_url
    assert_selector "h1", text: "Game V2s"
  end

  test "creating a Game v2" do
    visit game_v2s_url
    click_on "New Game V2"

    fill_in "Name", with: @game_v2.name
    click_on "Create Game v2"

    assert_text "Game v2 was successfully created"
    click_on "Back"
  end

  test "updating a Game v2" do
    visit game_v2s_url
    click_on "Edit", match: :first

    fill_in "Name", with: @game_v2.name
    click_on "Update Game v2"

    assert_text "Game v2 was successfully updated"
    click_on "Back"
  end

  test "destroying a Game v2" do
    visit game_v2s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game v2 was successfully destroyed"
  end
end
