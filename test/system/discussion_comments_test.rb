require "application_system_test_case"

class DiscussionCommentsTest < ApplicationSystemTestCase
  setup do
    @discussion_comment = discussion_comments(:one)
  end

  test "visiting the index" do
    visit discussion_comments_url
    assert_selector "h1", text: "Discussion Comments"
  end

  test "creating a Discussion comment" do
    visit discussion_comments_url
    click_on "New Discussion Comment"

    fill_in "Content", with: @discussion_comment.content
    fill_in "Discussion", with: @discussion_comment.discussion_id
    fill_in "User", with: @discussion_comment.user_id
    click_on "Create Discussion comment"

    assert_text "Discussion comment was successfully created"
    click_on "Back"
  end

  test "updating a Discussion comment" do
    visit discussion_comments_url
    click_on "Edit", match: :first

    fill_in "Content", with: @discussion_comment.content
    fill_in "Discussion", with: @discussion_comment.discussion_id
    fill_in "User", with: @discussion_comment.user_id
    click_on "Update Discussion comment"

    assert_text "Discussion comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Discussion comment" do
    visit discussion_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Discussion comment was successfully destroyed"
  end
end
