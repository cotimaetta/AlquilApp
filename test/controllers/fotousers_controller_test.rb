require "test_helper"

class FotousersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fotousers_new_url
    assert_response :success
  end

  test "should get create" do
    get fotousers_create_url
    assert_response :success
  end

  test "should get show" do
    get fotousers_show_url
    assert_response :success
  end

  test "should get index" do
    get fotousers_index_url
    assert_response :success
  end
end
