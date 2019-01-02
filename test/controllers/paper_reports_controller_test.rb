require 'test_helper'

class PaperReportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:normalUser1)
    @user = users(:normalUser1)
    @paper_report = paper_reports(:WAE_2018_mid_user1)
    @paper1 = papers(:WAE_2018_mid)
    @paper2 = papers(:WAE_2018_fin)
  end

  test "should get index" do
    get paper_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_paper_report_url
    assert_response :success
  end

  test "should create paper_report" do
    assert_difference('PaperReport.count') do
      post paper_reports_url, params: { paper_report: { 
        paper_id: @paper2.id,
        report: @paper_report.report,
        reporter_id: @user.id 
        } 
      }
    end

    assert_redirected_to paper_report_url(PaperReport.last)
  end

  test "should not create paper_report" do
    # User cannot create multiple report on 1 paper
    assert_no_difference('PaperReport.count') do
      post paper_reports_url, params: { paper_report: { 
        paper_id: @paper_report.paper_id,
        report: @paper_report.report,
        reporter_id: @user.id 
        } 
      }
    end

    # assert_redirected_to paper_report_url(PaperReport.last)
  end

  test "should show paper_report" do
    get paper_report_url(@paper_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_paper_report_url(@paper_report)
    assert_response :success
  end

  test "should update paper_report" do
    patch paper_report_url(@paper_report), params: { paper_report: { 
      paper_id: @paper_report.paper_id,
      report: @paper_report.report,
      reporter_id: @paper_report.reporter_id 
      } 
    }
    assert_redirected_to paper_report_url(@paper_report)
  end

  test "should not update paper_report" do
    # This case should not happen at all
    patch paper_report_url(@paper_report), params: { paper_report: { 
      paper_id: @paper_report.paper_id,
      report: @paper_report.report,
      reporter_id: 2 
      } 
    }
    assert_response :error
  end

  test "should destroy paper_report" do
    assert_difference('PaperReport.count', -1) do
      delete paper_report_url(@paper_report)
    end

    assert_redirected_to paper_reports_url
  end
end