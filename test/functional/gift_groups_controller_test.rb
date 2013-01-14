require 'test_helper'

class GiftGroupsControllerTest < ActionController::TestCase
  
  fixtures :gift_groups
  include Devise::TestHelpers
    
  setup do
    @gift_group = gift_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gift_groups)
    assert_template "index"
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gift_group" do
    assert_difference('GiftGroup.count') do
      post :create, :gift_group => @gift_group.attributes
    end

  end

  test "should show gift_group" do
    get :show, :id => @gift_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gift_group.to_param
    assert_response :success
  end

  test "should update gift_group" do
    put :update, :id => @gift_group.to_param, :gift_group => @gift_group.attributes
    assert_redirected_to gift_group_path(assigns(:gift_group))
  end

  test "should destroy gift_group" do
    assert_difference('GiftGroup.count', -1) do
      delete :destroy, :id => @gift_group.to_param
    end

    assert_redirected_to gift_groups_path
  end
end
