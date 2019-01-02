require 'test_helper'
class UserReportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:normalUser1)
    @report1_1_1 = user_reports(:report1_1_1)
  end
  test "should get index" do
    get user_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_user_report_url
    assert_response :success
  end

  test "should create user_report" do
    assert_difference('UserReport.count') do
      post user_reports_url, params: { user_report: { report: @report1_1_1.report, reporter_id: @report1_1_1.reporter_id, user_id: @report1_1_1.user_id } }
    end

    assert_redirected_to user_report_url(UserReport.last)
  end
  
  test "should not create user_report" do
    assert_no_difference('UserReport.count') do
      post user_reports_url, params: { user_report: { user_id: @report1_1_1.user_id } }
    end

    # assert_redirected_to user_report_url(UserReport.last)
  end

  test "should show user_report" do
    get user_report_url(@report1_1_1)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_user_report_url(@report1_1_1)
  #   assert_response :success
  # end

  # test "should update user_report" do
  #   patch user_report_url(@report1_1_1), params: { user_report: { report: @report1_1_1.report, reporter_id: @report1_1_1.reporter_id, user_id: @report1_1_1.user_id } }
  #   assert_redirected_to user_report_url(@report1_1_1)
  # end

  test "should destroy user_report" do
    assert_difference('UserReport.count', -1) do
      delete user_report_url(@report1_1_1)
    end

    assert_redirected_to user_reports_url
  end
end
