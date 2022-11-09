class CreateHistorialUsos < ActiveRecord::Migration[7.0]
  def change
    create_table :historial_usos do |t|
      t.float :monto
      t.datetime :fechaInicio
      t.datetime :fechaFinal
      t.integer :cantHoras
      t.integer :cantHoras
      
      t.references :user, null: false, foreign_key: true
      t.references :auto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
