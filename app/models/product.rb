class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :carts, through: :cart_items, dependent: :destroy

  has_one_attached :picture
  
  validates :picture, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :shipped_from, presence: true
  validates :delivery_estimated, presence: true
  validates :quantity_available, presence: true
end
