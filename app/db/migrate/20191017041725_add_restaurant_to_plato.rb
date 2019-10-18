class AddRestaurantToPlato < ActiveRecord::Migration[5.2]
  def change
    add_reference :platos, :restaurant, foreign_key: true
  end
end
