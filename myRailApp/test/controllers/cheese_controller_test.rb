require 'test_helper'

class CheeseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cheese_index_url
    assert_response :success
  end

end
