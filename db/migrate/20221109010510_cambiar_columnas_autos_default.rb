class CambiarColumnasAutosDefault < ActiveRecord::Migration[7.0]
  
    def change
      change_column :autos, :alquilado , :boolean , default: false
      change_column :autos, :en_servicio , :boolean , default: false 
    end

  
end
