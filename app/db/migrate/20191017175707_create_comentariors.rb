class CreateComentariors < ActiveRecord::Migration[5.2]
  def change
    create_table :comentariors do |t|
      t.text :contenido
      t.integer :valoracion
      t.references :restaurant, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
