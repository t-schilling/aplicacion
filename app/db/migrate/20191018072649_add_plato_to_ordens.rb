class AddPlatoToOrdens < ActiveRecord::Migration[5.2]
  def change
    add_reference :ordens, :plato, foreign_key: true

  end
end
