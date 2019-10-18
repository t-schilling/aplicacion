class Orden < ApplicationRecord
    belongs_to :restaurant
    belongs_to :user
    belongs_to :plato
end
