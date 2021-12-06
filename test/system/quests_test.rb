require "application_system_test_case"

class QuestsTest < ApplicationSystemTestCase
  setup do
    @quest = quests(:one)
  end

  test "visiting the index" do
    visit quests_url
    assert_selector "h1", text: "Quests"
  end

  test "creating a Quest" do
    visit quests_url
    click_on "New Quest"

    fill_in "Housekeeping total", with: @quest.housekeeping_total
    fill_in "Meta total", with: @quest.meta_total
    fill_in "Productivity total", with: @quest.productivity_total
    fill_in "Review total", with: @quest.review_total
    fill_in "Testing total", with: @quest.testing_total
    fill_in "Total points", with: @quest.total_points
    click_on "Create Quest"

    assert_text "Quest was successfully created"
    click_on "Back"
  end

  test "updating a Quest" do
    visit quests_url
    click_on "Edit", match: :first

    fill_in "Housekeeping total", with: @quest.housekeeping_total
    fill_in "Meta total", with: @quest.meta_total
    fill_in "Productivity total", with: @quest.productivity_total
    fill_in "Review total", with: @quest.review_total
    fill_in "Testing total", with: @quest.testing_total
    fill_in "Total points", with: @quest.total_points
    click_on "Update Quest"

    assert_text "Quest was successfully updated"
    click_on "Back"
  end

  test "destroying a Quest" do
    visit quests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quest was successfully destroyed"
  end
end
