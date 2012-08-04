require 'test_helper'

class ExceptionControllerTest < ActionController::TestCase
  test "should get restricted" do
    get :restricted
    assert_response :success
  end

end
