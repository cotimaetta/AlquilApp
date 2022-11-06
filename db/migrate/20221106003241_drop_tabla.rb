class DropTabla < ActiveRecord::Migration[7.0]
  def up
    #drop_table :historial_de_uso
  end
  def down 
    raise ActiveRecord::IrreversibleMigration
  end
end
