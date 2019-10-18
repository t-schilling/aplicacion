class CreatePlatos < ActiveRecord::Migration[5.2]
  def change
    create_table :platos do |t|
      t.string :nombre
      t.integer :precio
      t.text :descripcion
      t.integer :cantidad_personas
      t.string :imagen
      t.integer :valoracion


      t.timestamps
    end
  end
end
