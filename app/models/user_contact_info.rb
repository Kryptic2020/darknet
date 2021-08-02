class UserContactInfo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :shipped_from, presence: true
  validates :delivery_estimated, presence: true
  validates :quantity_available, presence: true

    #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving a listing
  def remove_whitespace
    self.street_number = self.street_number.strip
    self.unit = self.unit.strip
    self.street_name = self.street_name.strip
    self.suburb = self.suburb.strip
    self.phone = self.phone.strip
    self.postcode = self.postcode.strip
  end

end
