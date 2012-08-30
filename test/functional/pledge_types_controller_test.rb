require 'test_helper'

class PledgeTypesControllerTest < ActionController::TestCase
  setup do
    @pledge_type = pledge_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pledge_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pledge_type" do
    assert_difference('PledgeType.count') do
      post :create, pledge_type: { desc: @pledge_type.desc, image: @pledge_type.image, name: @pledge_type.name, project_id: @pledge_type.project_id }
    end

    assert_redirected_to pledge_type_path(assigns(:pledge_type))
  end

  test "should show pledge_type" do
    get :show, id: @pledge_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pledge_type
    assert_response :success
  end

  test "should update pledge_type" do
    put :update, id: @pledge_type, pledge_type: { desc: @pledge_type.desc, image: @pledge_type.image, name: @pledge_type.name, project_id: @pledge_type.project_id }
    assert_redirected_to pledge_type_path(assigns(:pledge_type))
  end

  test "should destroy pledge_type" do
    assert_difference('PledgeType.count', -1) do
      delete :destroy, id: @pledge_type
    end

    assert_redirected_to pledge_types_path
  end
end
