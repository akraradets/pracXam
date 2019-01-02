require 'test_helper'

class PapersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:normalUser1)
    @paper = papers(:WAE_2018_mid)
  end

  test "should get index" do
    get papers_url
    assert_response :success
  end

  test "should get new" do
    get new_paper_url
    assert_response :success
  end

  test "should create paper" do
    assert_difference('Paper.count') do
      post papers_url, params: { paper: { 
        annual: @paper.annual,
        duration: @paper.duration,
        month: @paper.month,
        open_book: @paper.open_book,
        open_network: @paper.open_network,
        prof_name: @paper.prof_name,
        subject_id: @paper.subject_id,
        user_id: @paper.user_id,
        year: '2019' 
        } 
      }
    end

    assert_redirected_to paper_url(Paper.last)
  end


  test "should not create paper" do
    assert_no_difference('Paper.count') do
      post papers_url, params: { paper: { 
        annual: @paper.annual,
        duration: @paper.duration,
        month: @paper.month,
        open_book: @paper.open_book,
        open_network: @paper.open_network,
        prof_name: @paper.prof_name,
        subject_id: @paper.subject_id,
        user_id: @paper.user_id,
        year: @paper.year 
        } 
      }
    end
  end

  test "should show paper" do
    get paper_url(@paper)
    assert_response :success
  end

  test "should get edit" do
    get edit_paper_url(@paper)
    assert_response :success
  end

  test "should update paper" do
    patch paper_url(@paper), params: { paper: { annual: @paper.annual, duration: @paper.duration, month: @paper.month, open_book: @paper.open_book, open_network: @paper.open_network, prof_name: @paper.prof_name, subject_id: @paper.subject_id, user_id: @paper.user_id, year: @paper.year } }
    # debugger
    assert_redirected_to paper_url(@paper)
  end

  test "should not update paper" do
    patch paper_url(@paper), params: { paper: { 
      annual: 'fin',
      duration: @paper.duration,
      month: @paper.month,
      open_book: @paper.open_book,
      open_network: @paper.open_network,
      prof_name: @paper.prof_name,
      subject_id: @paper.subject_id,
      user_id: @paper.user_id,
      year: @paper.year } }

    assert_response :error
  end

  test "should destroy paper" do
    assert_difference('Paper.count', -1) do
      delete paper_url(@paper)
    end

    assert_redirected_to papers_url
  end

  # Test AJAX
  # Difficulty
  test "[ajax] should return difficulties of paper" do
    get "/papers/#{@paper.id}/rate", xhr: true

    assert_includes @response.body, @paper.difficulties.group(:rate).count.to_json
  end
  
  test "[ajax] should return difficulties of paper with currentRate=-1" do
    sign_in users(:normalUser2)
    get "/papers/#{@paper.id}/rate", xhr: true

    assert_includes @response.body, "\"currentRate\":-1}"
  end
  
  test "[ajax] should add difficulties of paper" do
    sign_in users(:normalUser2)
    assert_difference('PaperDifficulty.count') do
      post "/papers/#{@paper.id}/rate",  params: { rate:3 }, xhr: true
    end

    assert_includes @response.body, @paper.difficulties.group(:rate).count.to_json
  end

  test "[ajax] should update difficulties of paper" do
    assert_no_difference('PaperDifficulty.count') do
      post "/papers/#{@paper.id}/rate",  params: { rate:3 }, xhr: true
    end

    assert_includes @response.body, @paper.difficulties.group(:rate).count.to_json
  end

  # Feedback
  test "[ajax] should return feedbacks of paper" do
    get "/papers/#{@paper.id}/like", xhr: true

    assert_includes @response.body, @paper.feedbacks.group(:feedback).count.to_json
  end
  
  test "[ajax] should return feedbacks of paper with userLike=-1" do
    sign_in users(:normalUser2)
    get "/papers/#{@paper.id}/like", xhr: true

    assert_includes @response.body, "\"userLike\":-1}"
  end
  
  test "[ajax] should add feedbacks of paper" do
    sign_in users(:normalUser2)
    assert_difference('PaperFeedback.count') do
      post "/papers/#{@paper.id}/like",  params: { like:1 }, xhr: true
    end

    assert_includes @response.body, @paper.feedbacks.group(:feedback).count.to_json
  end

  test "[ajax] should update feedbacks of paper" do
    assert_no_difference('PaperFeedback.count') do
      post "/papers/#{@paper.id}/like",  params: { like:0 }, xhr: true
    end

    assert_includes @response.body, @paper.feedbacks.group(:feedback).count.to_json
  end

  test "[ajax] should destroy feedbacks of paper" do
    assert_difference('PaperFeedback.count', -1) do
      post "/papers/#{@paper.id}/like",  params: { like:1 }, xhr: true
    end

    assert_includes @response.body, @paper.feedbacks.group(:feedback).count.to_json
  end

end
