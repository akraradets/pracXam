require 'test_helper'

class DiscussionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:normalUser1)
    @user = users(:normalUser1)
    @discussion = discussions(:WAE_2018_mid_discuss1)
    @discussion_not_my = discussions(:WAE_2018_mid_discuss2)
  end

  test "should get index" do
    get discussions_url
    assert_response :success
  end

  test "should get new" do
    get new_discussion_url
    assert_response :success
  end

  test "should create discussion" do
    assert_difference('Discussion.count') do
      post discussions_url, params: { discussion: { 
        content: @discussion.content,
        paper_id: @discussion.paper_id,
        user_id: @discussion.user_id 
        } 
      }
    end

    assert_redirected_to paper_url(@discussion.paper)
  end

  test "should not create discussion" do
    assert_no_difference('Discussion.count') do
      post discussions_url, params: { discussion: { 
        content: "",
        paper_id: 1,
        user_id: @discussion.user_id 
        } 
      }
    end

    # assert_redirected_to discussion_url(Discussion.last)
  end

  test "should show discussion" do
    get discussion_url(@discussion)
    assert_response :success
  end

  test "should get edit" do
    get edit_discussion_url(@discussion)
    assert_response :success
  end

  test "should update discussion" do
    patch discussion_url(@discussion), params: { discussion: { content: @discussion.content, paper_id: @discussion.paper_id, user_id: @discussion.user_id } }
    assert_redirected_to discussion_url(@discussion)
  end

  test "should not update discussion" do
    patch discussion_url(@discussion), params: { discussion: { 
      content: @discussion.content, 
      paper_id: 900000, 
      user_id: @discussion.user_id 
      } 
    }
    assert_response :error
  end

  test "should destroy discussion" do
    assert_difference('Discussion.count', -1) do
      delete discussion_url(@discussion)
    end

    # assert_redirected_to discussions_url
    assert_redirected_to paper_url(@discussion.paper)
  end
  
  test "should not destroy discussion" do
    assert_no_difference('Discussion.count') do
      delete discussion_url(@discussion_not_my)
    end

    # assert_redirected_to discussions_url
    assert_redirected_to paper_url(@discussion_not_my.paper)
  end
end
