class CambiarColumnasSaldoValidacion < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :validacion , :boolean , default: false
    change_column :users, :saldo , :float , default: 10000
  end
end
