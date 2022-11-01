class CreateAutos < ActiveRecord::Migration[7.0]
  def change
    create_table :autos do |t|
      t.string :patente
      t.string :marca
      t.string :modelo
      t.integer :cant_puertas
      t.text :descripcion
      t.float :cant_combustible

      t.timestamps
    end
  end
end
