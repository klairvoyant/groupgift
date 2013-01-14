require 'test_helper'

class GiftReceiversControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  fixtures :gift_receivers
  setup do
    @gift_receiver = gift_receivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gift_receivers)
    
  end

  test "should get new" do
    get :new
    assert_response :success
    
  end

  test "should create gift_receiver" do
    assert_difference('GiftReceiver.count') do
      post :create, :gift_receiver => @gift_receiver.attributes
    end


  end

  test "should show gift_receiver" do
    get :show, :id => @gift_receiver.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gift_receiver.to_param
    assert_response :success
  end

  test "should update gift_receiver" do
    put :update, :id => @gift_receiver.to_param, :gift_receiver => @gift_receiver.attributes
    assert_redirected_to gift_receiver_path(assigns(:gift_receiver))
  end

  test "should destroy gift_receiver" do
    assert_difference('GiftReceiver.count', -1) do
      delete :destroy, :id => @gift_receiver.to_param
    end

    assert_redirected_to gift_receivers_path
  end
  
  test "should get giftselect" do
    get :giftSelect
    assert_response :success
    assert_not_nil assigns(:gift_selecteds)
    
  end
end
