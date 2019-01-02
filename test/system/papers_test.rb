require "application_system_test_case"

class PapersTest < ApplicationSystemTestCase
  setup do
    @paper = papers(:one)
  end

  test "visiting the index" do
    visit papers_url
    assert_selector "h1", text: "Papers"
  end

  test "creating a Paper" do
    visit papers_url
    click_on "New Paper"

    fill_in "Annual", with: @paper.annual
    fill_in "Duration", with: @paper.duration
    fill_in "Month", with: @paper.month
    fill_in "Open Book", with: @paper.open_book
    fill_in "Open Network", with: @paper.open_network
    fill_in "Prof Name", with: @paper.prof_name
    fill_in "Subject", with: @paper.subject_id
    fill_in "User", with: @paper.user_id
    fill_in "Year", with: @paper.year
    click_on "Create Paper"

    assert_text "Paper was successfully created"
    click_on "Back"
  end

  test "updating a Paper" do
    visit papers_url
    click_on "Edit", match: :first

    fill_in "Annual", with: @paper.annual
    fill_in "Duration", with: @paper.duration
    fill_in "Month", with: @paper.month
    fill_in "Open Book", with: @paper.open_book
    fill_in "Open Network", with: @paper.open_network
    fill_in "Prof Name", with: @paper.prof_name
    fill_in "Subject", with: @paper.subject_id
    fill_in "User", with: @paper.user_id
    fill_in "Year", with: @paper.year
    click_on "Update Paper"

    assert_text "Paper was successfully updated"
    click_on "Back"
  end

  test "destroying a Paper" do
    visit papers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Paper was successfully destroyed"
  end
end
