class Status < ApplicationRecord
  has_many :carts, dependent: :destroy

  #Validations
  validates :name, length: {minimum: 3, too_short: "3 is the minimum number of caracter"}

  #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving status
  def remove_whitespace
    self.name = self.name.strip
  end
end
