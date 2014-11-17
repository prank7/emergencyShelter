require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get api_index" do
    get :api_index
    assert_response :success
  end

  test "should get api_show" do
    get :api_show
    assert_response :success
  end

  test "should get api_destroy" do
    get :api_destroy
    assert_response :success
  end

  test "should get api_edit" do
    get :api_edit
    assert_response :success
  end

end
