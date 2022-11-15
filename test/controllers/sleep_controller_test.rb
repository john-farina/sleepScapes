require "test_helper"

class SleepControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sleep_index_url
    assert_response :success
  end
end
