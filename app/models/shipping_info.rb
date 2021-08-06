class ShippingInfo < ApplicationRecord
  belongs_to :user
  validates :street_number, presence: true
  validates :unit, presence: true
  validates :street_name, presence: true
  validates :suburb, presence: true
  validates :phone, presence: true
  validates :postcode, presence: true

    #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving a user contact info
  def remove_whitespace
    self.unit = self.unit.strip
    self.street_name = self.street_name.strip
    self.suburb = self.suburb.strip
    self.phone = self.phone.strip
    self.postcode = self.postcode.strip
  end

end
