require "test_helper"

class HistorialUsosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historial_uso = historial_usos(:one)
  end

  test "should get index" do
    get historial_usos_url
    assert_response :success
  end

  test "should get new" do
    get new_historial_uso_url
    assert_response :success
  end

  test "should create historial_uso" do
    assert_difference("HistorialUso.count") do
      post historial_usos_url, params: { historial_uso: { auto_id: @historial_uso.auto_id, cantHoras: @historial_uso.cantHoras, fechaFinal: @historial_uso.fechaFinal, fechaInicio: @historial_uso.fechaInicio, monto: @historial_uso.monto, user_id: @historial_uso.user_id } }
    end

    assert_redirected_to historial_uso_url(HistorialUso.last)
  end

  test "should show historial_uso" do
    get historial_uso_url(@historial_uso)
    assert_response :success
  end

  test "should get edit" do
    get edit_historial_uso_url(@historial_uso)
    assert_response :success
  end

  test "should update historial_uso" do
    patch historial_uso_url(@historial_uso), params: { historial_uso: { auto_id: @historial_uso.auto_id, cantHoras: @historial_uso.cantHoras, fechaFinal: @historial_uso.fechaFinal, fechaInicio: @historial_uso.fechaInicio, monto: @historial_uso.monto, user_id: @historial_uso.user_id } }
    assert_redirected_to historial_uso_url(@historial_uso)
  end

  test "should destroy historial_uso" do
    assert_difference("HistorialUso.count", -1) do
      delete historial_uso_url(@historial_uso)
    end

    assert_redirected_to historial_usos_url
  end
end
