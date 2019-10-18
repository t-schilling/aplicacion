class CreateOrdens < ActiveRecord::Migration[5.2]
  def change
    create_table :ordens do |t|
      t.string :nombreplato
      t.float :precio
      t.string :pago
      t.string :direccion
      t.datetime :llegada
      t.string :estado
      t.string :info

      t.timestamps
    end
  end
end
