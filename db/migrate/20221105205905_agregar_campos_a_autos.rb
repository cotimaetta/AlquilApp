class AgregarCamposAAutos < ActiveRecord::Migration[7.0]
  def change
    add_column :autos, :alquilado, :boolean
    add_column :autos, :en_servicio, :boolean
    
  end
end
