class CambiarTipoValidacion < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :validacion , :integer , default: 2
  end
end
