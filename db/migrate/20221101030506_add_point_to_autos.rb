class AddPointToAutos < ActiveRecord::Migration[7.0]
  def change
    add_column :autos, :location_point_y, :string
    add_column :autos, :location_point_x, :string
  end
end