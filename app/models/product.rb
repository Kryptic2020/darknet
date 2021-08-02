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


  #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving a product
  def remove_whitespace
    self.title = self.title.strip
    self.description = self.description.strip
    self.shipped_from = self.shipped_from.strip
  end
end
