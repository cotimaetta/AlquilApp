class AgregarTablaHistorialUso < ActiveRecord::Migration[7.0]
  def change
    create_table :historial_de_uso do |t|
      t.datetime :inicio_alquiler
      t.datetime :fin_alquiler
      t.float :tiempo_alquiler
      t.float :monto

      t.timestamps
    end
  end
end
