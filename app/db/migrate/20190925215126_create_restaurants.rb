class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :nombre
      t.string :correo
      t.string :direccion
      t.integer :valoracion
      t.string :imagen
      t.string :numero_telefonico

      t.timestamps
    end
  end
end
