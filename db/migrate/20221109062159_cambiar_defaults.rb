class CambiarDefaults < ActiveRecord::Migration[7.0]
  def change
    
    change_column :autos, :en_servicio , :boolean , default: true 
  end

end
