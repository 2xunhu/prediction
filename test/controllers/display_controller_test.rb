require 'test_helper'

class DisplayControllerTest < ActionController::TestCase
  test "should get weather" do
    get :weather
    assert_response :success
  end

end
