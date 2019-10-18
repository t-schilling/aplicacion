class AddRestaurantToOrdens < ActiveRecord::Migration[5.2]
  def change
    add_reference :ordens, :restaurant, foreign_key: true
  end
end
