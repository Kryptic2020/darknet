class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  
  #Validations
  validates :quantity, numericality: {greater_than_or_equal_to:1}
  validates :price, numericality: {greater_than_or_equal_to:0}
end
