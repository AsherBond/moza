require 'test_helper'

class ExceptionsControllerTest < ActionController::TestCase
  test "should get restricted" do
    get :restricted
    assert_response :success
  end

end
