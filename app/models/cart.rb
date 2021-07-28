class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :status
  belongs_to :payment
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items, dependent: :destroy
end
