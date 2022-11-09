require "test_helper"

class HistorialUsosControllerTest < ActionDispatch::IntegrationTest
  test "should get agregarHoras" do
    get historial_usos_agregarHoras_url
    assert_response :success
  end
end
