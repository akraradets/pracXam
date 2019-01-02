require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:normalUser1)
    @WAE_with_paper = subjects(:WAE)
    @TOC_no_paper = subjects(:TOC)
  end

  test "should get index" do
    get subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_url
    assert_response :success
  end

  test "should create subject" do
    assert_difference('Subject.count') do
      post subjects_url, params: { 
        subject: { 
          code: 'AT70.03', 
          name: 'DSA',
          cs_required: true, 
          im_required: false, 
          }
        }
    end
    assert_redirected_to subjects_url
    # assert_redirected_to subject_url(Subject.last)
  end

  test "should not create subject" do
    assert_no_difference('Subject.count') do
      post subjects_url, params: { 
        subject: { 
          code: @TOC_no_paper.code, 
          name: @TOC_no_paper.name,
          cs_required: @TOC_no_paper.cs_required, 
          im_required: @TOC_no_paper.im_required
          }
        }
    end
  end

  test "should show subject" do
    get subject_url(@WAE_with_paper)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_url(@WAE_with_paper)
    assert_response :success
  end

  test "should update subject" do
    patch subject_url(@WAE_with_paper), params: { 
      subject: { 
        code: @WAE_with_paper.code,
        cs_required: @WAE_with_paper.cs_required,
        im_required: @WAE_with_paper.im_required,
        name: @WAE_with_paper.name } }
    # debugger
    assert_redirected_to subjects_url
  end

  test "should not update subject" do
    patch subject_url(@WAE_with_paper), params: { 
      subject: { 
        code: "",
        name: "",
        cs_required: @WAE_with_paper.cs_required,
        im_required: @WAE_with_paper.im_required
        } 
      }
    assert_response :error
  end

  test "should destroy subject" do
    assert_difference('Subject.count', -1) do
      delete subject_url(@TOC_no_paper)
    end

    assert_redirected_to subjects_url
  end

  test "should destroy not subject" do
    assert_no_difference('Subject.count', -1) do
      delete subject_url(@WAE_with_paper)
    end
  end
end
