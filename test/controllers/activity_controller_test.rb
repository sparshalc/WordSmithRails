require "test_helper"

class ActivityControllerTest < ActionDispatch::IntegrationTest
  test "should get logs" do
    get activity_logs_url
    assert_response :success
  end
end
