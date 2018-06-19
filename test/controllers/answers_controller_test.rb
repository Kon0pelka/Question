require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get answers_show_url
    assert_response :success
  end

  test "should get index" do
    get answers_index_url
    assert_response :success
  end

  test "should get create" do
    get answers_create_url
    assert_response :success
  end

  test "should get delete" do
    get answers_delete_url
    assert_response :success
  end

  test "should get edit" do
    get answers_edit_url
    assert_response :success
  end

end
