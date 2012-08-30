require 'test_helper'

class UserdataControllerTest < ActionController::TestCase
  setup do
    @userdatum = userdata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userdata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userdatum" do
    assert_difference('Userdatum.count') do
      post :create, userdatum: { user_id: @userdatum.user_id }
    end

    assert_redirected_to userdatum_path(assigns(:userdatum))
  end

  test "should show userdatum" do
    get :show, id: @userdatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userdatum
    assert_response :success
  end

  test "should update userdatum" do
    put :update, id: @userdatum, userdatum: { user_id: @userdatum.user_id }
    assert_redirected_to userdatum_path(assigns(:userdatum))
  end

  test "should destroy userdatum" do
    assert_difference('Userdatum.count', -1) do
      delete :destroy, id: @userdatum
    end

    assert_redirected_to userdata_path
  end
end
