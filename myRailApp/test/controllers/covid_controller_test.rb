require 'test_helper'

class CovidControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get covid_index_url
    assert_response :success
  end

end
