require "test_helper"

class FotouserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fotouser_new_url
    assert_response :success
  end

  test "should get create" do
    get fotouser_create_url
    assert_response :success
  end

  test "should get show" do
    get fotouser_show_url
    assert_response :success
  end
end
