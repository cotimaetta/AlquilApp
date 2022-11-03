class CreateFotousers < ActiveRecord::Migration[7.0]
  def change
    create_table :fotousers do |t|
      t.integer :id_user

      t.timestamps
    end
  end
end
