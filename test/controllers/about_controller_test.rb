require "test_helper"

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get Page" do
    get about_Page_url
    assert_response :success
  end
end
