require 'test_helper'

class QuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quest = quests(:one)
  end

  test "should get index" do
    get quests_url
    assert_response :success
  end

  test "should get new" do
    get new_quest_url
    assert_response :success
  end

  test "should create quest" do
    assert_difference('Quest.count') do
      post quests_url, params: { quest: { housekeeping_total: @quest.housekeeping_total, meta_total: @quest.meta_total, productivity_total: @quest.productivity_total, review_total: @quest.review_total, testing_total: @quest.testing_total, total_points: @quest.total_points } }
    end

    assert_redirected_to quest_url(Quest.last)
  end

  test "should show quest" do
    get quest_url(@quest)
    assert_response :success
  end

  test "should get edit" do
    get edit_quest_url(@quest)
    assert_response :success
  end

  test "should update quest" do
    patch quest_url(@quest), params: { quest: { housekeeping_total: @quest.housekeeping_total, meta_total: @quest.meta_total, productivity_total: @quest.productivity_total, review_total: @quest.review_total, testing_total: @quest.testing_total, total_points: @quest.total_points } }
    assert_redirected_to quest_url(@quest)
  end

  test "should destroy quest" do
    assert_difference('Quest.count', -1) do
      delete quest_url(@quest)
    end

    assert_redirected_to quests_url
  end
end
