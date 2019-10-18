class Comentarior < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :valoracion, numericality: {only_integer:true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
end
