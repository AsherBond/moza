require 'test_helper'

class FourOhFoursControllerTest < ActionController::TestCase
  test "should get 404" do
    get :404
    assert_response :success
  end

end
