require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work = works(:one)
  end

  test "should get index" do
    get works_url, as: :json
    assert_response :success
  end

  test "should create work" do
    assert_difference('Work.count') do
      post works_url, params: { work: { employer_id: @work.employer_id, name: @work.name, user_id: @work.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show work" do
    get work_url(@work), as: :json
    assert_response :success
  end

  test "should update work" do
    patch work_url(@work), params: { work: { employer_id: @work.employer_id, name: @work.name, user_id: @work.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete work_url(@work), as: :json
    end

    assert_response 204
  end
end
