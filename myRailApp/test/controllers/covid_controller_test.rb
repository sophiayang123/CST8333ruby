require 'test_helper'

class CovidControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get covid_index_url
    assert_response :success
  end


  # check if controller new method can save new record
  test "should initial new record" do
    "test by Shuting Yang"
    post = Covid.new
    assert post.save, "Saved the new record"
  end

  # creating an instance variable to test with
  def setup
    @record = Covid.create(adjuster_name: "TestLastName", address_1: "4511 W 200 S", id: 1)
  end

  # Testing going to an already created adjuster and deleting them
  test "get edit adjuster form and delete adjuster" do
    delete edit_adjuster_path(@record)
    follow_redirect!
    assert_nil(@record)
  end

end
