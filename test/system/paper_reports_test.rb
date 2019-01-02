require "application_system_test_case"

class PaperReportsTest < ApplicationSystemTestCase
  setup do
    @paper_report = paper_reports(:one)
  end

  test "visiting the index" do
    visit paper_reports_url
    assert_selector "h1", text: "Paper Reports"
  end

  test "creating a Paper report" do
    visit paper_reports_url
    click_on "New Paper Report"

    fill_in "Paper", with: @paper_report.paper_id
    fill_in "Report", with: @paper_report.report
    fill_in "Reporter", with: @paper_report.reporter_id
    click_on "Create Paper report"

    assert_text "Paper report was successfully created"
    click_on "Back"
  end

  test "updating a Paper report" do
    visit paper_reports_url
    click_on "Edit", match: :first

    fill_in "Paper", with: @paper_report.paper_id
    fill_in "Report", with: @paper_report.report
    fill_in "Reporter", with: @paper_report.reporter_id
    click_on "Update Paper report"

    assert_text "Paper report was successfully updated"
    click_on "Back"
  end

  test "destroying a Paper report" do
    visit paper_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Paper report was successfully destroyed"
  end
end
