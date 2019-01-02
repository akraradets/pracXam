require 'test_helper'

class DiscussionCommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:normalUser1)
    @user = users(:normalUser1)
    @discussion_comment = discussion_comments(:discuss1_comment1)
    @discussion_comment_not_my = discussion_comments(:discuss1_comment2)
  end

  test "should get index" do
    get discussion_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_discussion_comment_url
    assert_response :success
  end

  test "should create discussion_comment" do
    assert_difference('DiscussionComment.count') do
      post discussion_comments_url, params: { discussion_comment: { 
        content: @discussion_comment.content, 
        discussion_id: @discussion_comment.discussion_id, 
        user_id: @discussion_comment.user_id 
        } 
      }
    end

    assert_redirected_to paper_url(@discussion_comment.discussion.paper)
  end

  test "should not create discussion_comment" do
    assert_no_difference('DiscussionComment.count') do
      post discussion_comments_url, params: { discussion_comment: { 
        content: '', 
        discussion_id: 1, 
        user_id: @discussion_comment.user_id 
        } 
      }
    end
  end

  test "should show discussion_comment" do
    get discussion_comment_url(@discussion_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_discussion_comment_url(@discussion_comment)
    assert_response :success
  end

  test "should update discussion_comment" do
    patch discussion_comment_url(@discussion_comment), params: { discussion_comment: { content: @discussion_comment.content, discussion_id: @discussion_comment.discussion_id, user_id: @discussion_comment.user_id } }
    assert_redirected_to discussion_comment_url(@discussion_comment)
  end

  test "should not update discussion_comment" do
    patch discussion_comment_url(@discussion_comment), params: { discussion_comment: { 
      content: @discussion_comment.content, 
      discussion_id: 9000000, 
      user_id: @discussion_comment.user_id 
      } 
    }
    assert_response :error
  end

  test "should destroy discussion_comment" do
    assert_difference('DiscussionComment.count', -1) do
      delete discussion_comment_url(@discussion_comment)
    end

    # assert_redirected_to discussion_comments_url
    assert_redirected_to paper_url(@discussion_comment.discussion.paper)
  end

  test "should not destroy discussion_comment" do
    assert_no_difference('DiscussionComment.count') do
      delete discussion_comment_url(@discussion_comment_not_my)
    end

    # assert_redirected_to discussion_comments_url
    assert_redirected_to paper_url(@discussion_comment_not_my.discussion.paper)
  end
end
