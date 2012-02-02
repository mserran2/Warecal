require 'test_helper'

class SubRequestsControllerTest < ActionController::TestCase
  setup do
    @sub_request = sub_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_request" do
    assert_difference('SubRequest.count') do
      post :create, sub_request: @sub_request.attributes
    end

    assert_redirected_to sub_request_path(assigns(:sub_request))
  end

  test "should show sub_request" do
    get :show, id: @sub_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_request.to_param
    assert_response :success
  end

  test "should update sub_request" do
    put :update, id: @sub_request.to_param, sub_request: @sub_request.attributes
    assert_redirected_to sub_request_path(assigns(:sub_request))
  end

  test "should destroy sub_request" do
    assert_difference('SubRequest.count', -1) do
      delete :destroy, id: @sub_request.to_param
    end

    assert_redirected_to sub_requests_path
  end
end
