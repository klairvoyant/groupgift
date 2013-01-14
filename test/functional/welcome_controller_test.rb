require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "Welcome index" do
    get :index
   assert_response :success
    
  end

end
