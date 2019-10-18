class Restaurant < ApplicationRecord
  has_many :platos , dependent: :destroy
  has_many :ordens
  has_many :comentariors , dependent: :destroy
  validates :nombre, :correo, :direccion, :valoracion, :numero_telefonico, presence: true
  validates :numero_telefonico, length: {is: 9}

end
