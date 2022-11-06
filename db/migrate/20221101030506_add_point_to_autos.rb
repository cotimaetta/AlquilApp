class AddPointToAutos < ActiveRecord::Migration[7.0]
  def change
    add_column :autos, :location_point, :point
  end
end