class Historialusos < ActiveRecord::Migration[7.0]
  def change
    create_table :historialusos do |t|
      t.datetime :fecha_inicio
      t.datetime :fecha_fin
      t.float :cant_horas
      t.float :monto
      t.integer :horasExtra

      t.references :user, null: false, foreign_key: true
      t.references :auto, null: false, foreign_key: true
    end
  end
end
