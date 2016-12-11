require 'test_helper'

class ScheduelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduel = scheduels(:one)
  end

  test "should get index" do
    get scheduels_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduel_url
    assert_response :success
  end

  test "should create scheduel" do
    assert_difference('Scheduel.count') do
      post scheduels_url, params: { scheduel: { grade_id: @scheduel.grade_id } }
    end

    assert_redirected_to scheduel_url(Scheduel.last)
  end

  test "should show scheduel" do
    get scheduel_url(@scheduel)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduel_url(@scheduel)
    assert_response :success
  end

  test "should update scheduel" do
    patch scheduel_url(@scheduel), params: { scheduel: { grade_id: @scheduel.grade_id } }
    assert_redirected_to scheduel_url(@scheduel)
  end

  test "should destroy scheduel" do
    assert_difference('Scheduel.count', -1) do
      delete scheduel_url(@scheduel)
    end

    assert_redirected_to scheduels_url
  end
end
