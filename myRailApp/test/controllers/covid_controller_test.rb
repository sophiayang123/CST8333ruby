require 'test_helper'
#
class CovidControllerTest < ActionDispatch::IntegrationTest
  # called before every single test
  setup do
    @record = Covid.create(              
      cid: Covid.processAsString('test'),
      date: Covid.processAsLocalDate('2020-12-01'),
      cases: Covid.processAsInteger('0'),
      deaths: Covid.processAsInteger('0'),
      name_fr: Covid.processAsString('test'),
      name_en: Covid.processAsString('test') )
  end

   # called after every single test
  teardown do
    @record = nil
  end

  test "should get index" do
    get covid_index_url
    assert_response :success
  end

  # check if controller new method can save new record
  test "should initial new record" do
    "test by Shuting Yang"
    rec = Covid.new
    assert rec.save, "insert successfully"
  end
  
   # check if destroy record work
  test "should destroy article" do
    assert_difference('Covid.count', -1) do
      delete covid_delete_path(@record)
    end
    assert_redirected_to '/'
  end
  # check if update record work
  test "should update article" do
    # get covid_edit_path(@record), params: {  cid: "updated" }
    assert_redirected_to covid_update_path(@record)
    # Reload association to fetch updated data and assert that title is updated.
    @record.reload
    assert_equal "updated", @record.cid
  end
end
