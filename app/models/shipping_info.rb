class ShippingInfo < ApplicationRecord
  belongs_to :user

  #Validations
  validates :street_number, presence: true, numericality: {only_integer:true}
  validates :unit, presence: true, length: {in: 1..5}
  validates :street_name, presence: true, length: {in: 2..50}
  validates :suburb, presence: true, length: {in: 2..30}
  validates :phone, presence: true, length: {in: 9..10}
  validates :postcode, presence: true, length: {in: 4..5}

    #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving a shipping info
  def remove_whitespace
    self.unit = self.unit.strip
    self.street_name = self.street_name.strip
    self.suburb = self.suburb.strip
  end

end
