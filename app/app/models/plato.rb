class Plato < ApplicationRecord
  validates :nombre, :descripcion, :valoracion, :precio, :cantidad_personas,  presence: true
  validates :descripcion, length: {minimum: 4 }
  validates :nombre, uniqueness: true
  belongs_to :restaurant
  has_many :ordens , dependent: :destroy

end
