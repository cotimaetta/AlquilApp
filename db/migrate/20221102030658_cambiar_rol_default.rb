class CambiarRolDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :rol , :integer , default: 2
  end
end
