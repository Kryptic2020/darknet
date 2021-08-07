class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages, dependent: :destroy
  has_many :carts, through: :cart_items, dependent: :destroy
  has_one_attached :picture
  
  #validations
  validates :picture, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :shipped_from, presence: true
  validates :delivery_estimated, presence: true
  validates :quantity_available, presence: true

  #Class Method search, sorting and filtering with eagle loading - Page controller - for listing.html
  def self.search( search, category, filter)
    key = ""
    value = :asc
    if filter == "price-asc"
      key = "price"      
    elsif filter == "price-desc"
      key = "price"
      value = :desc
    elsif filter == "title-asc"
      key = "title"      
    else
      key = "title"
      value = :desc
    end  

    # Return Query acording to conditions received as args. 
    if search && search != "" && category == ""
      return self.where("LOWER(#{:title}) LIKE ?","%#{search.downcase}%").order(key => value)
    elsif search && search != "" && category && category != "" 
      return self.order(key => value).where("LOWER(#{:title}) LIKE ?","%#{search.downcase}%").where(category_id:category.to_i).includes(:category)
    elsif search == "" && category != ""
      return self.order(key => value).where(category_id:category.to_i).includes(:category)      
    end
    return self.order(key => value).includes(:category)
  end 

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
