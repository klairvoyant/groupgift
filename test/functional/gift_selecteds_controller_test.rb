require 'test_helper'

class GiftSelectedsControllerTest < ActionController::TestCase
  fixtures :gift_selecteds
  include Devise::TestHelpers
  setup do
    @gift_selected = gift_selecteds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gift_selecteds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gift_selected" do
    assert_difference('GiftSelected.count') do
      post :create, :gift_selected => @gift_selected.attributes
    end

    
  end

  test "should show gift_selected" do
    get :show, :id => @gift_selected.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gift_selected.to_param
    assert_response :success
  end

  test "should update gift_selected" do
    put :update, :id => @gift_selected.to_param, :gift_selected => @gift_selected.attributes
    assert_redirected_to gift_selected_path(assigns(:gift_selected))
  end

  test "should destroy gift_selected" do
    assert_difference('GiftSelected.count', -1) do
      delete :destroy, :id => @gift_selected.to_param
    end

    
  end
end
