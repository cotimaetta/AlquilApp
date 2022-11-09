require "application_system_test_case"

class HistorialUsosTest < ApplicationSystemTestCase
  setup do
    @historial_uso = historial_usos(:one)
  end

  test "visiting the index" do
    visit historial_usos_url
    assert_selector "h1", text: "Historial usos"
  end

  test "should create historial uso" do
    visit historial_usos_url
    click_on "New historial uso"

    fill_in "Auto", with: @historial_uso.auto_id
    fill_in "Canthoras", with: @historial_uso.cantHoras
    fill_in "Fechafinal", with: @historial_uso.fechaFinal
    fill_in "Fechainicio", with: @historial_uso.fechaInicio
    fill_in "Monto", with: @historial_uso.monto
    fill_in "User", with: @historial_uso.user_id
    click_on "Create Historial uso"

    assert_text "Historial uso was successfully created"
    click_on "Back"
  end

  test "should update Historial uso" do
    visit historial_uso_url(@historial_uso)
    click_on "Edit this historial uso", match: :first

    fill_in "Auto", with: @historial_uso.auto_id
    fill_in "Canthoras", with: @historial_uso.cantHoras
    fill_in "Fechafinal", with: @historial_uso.fechaFinal
    fill_in "Fechainicio", with: @historial_uso.fechaInicio
    fill_in "Monto", with: @historial_uso.monto
    fill_in "User", with: @historial_uso.user_id
    click_on "Update Historial uso"

    assert_text "Historial uso was successfully updated"
    click_on "Back"
  end

  test "should destroy Historial uso" do
    visit historial_uso_url(@historial_uso)
    click_on "Destroy this historial uso", match: :first

    assert_text "Historial uso was successfully destroyed"
  end
end
