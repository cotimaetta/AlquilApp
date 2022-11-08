require "test_helper"

class HistorialusosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get historialusos_index_url
    assert_response :success
  end

  test "should get new" do
    get historialusos_new_url
    assert_response :success
  end

  test "should get show" do
    get historialusos_show_url
    assert_response :success
  end
end
