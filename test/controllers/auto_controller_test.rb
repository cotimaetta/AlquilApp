require "test_helper"

class AutoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get auto_new_url
    assert_response :success
  end

  test "should get create" do
    get auto_create_url
    assert_response :success
  end
end
