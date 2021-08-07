class Payment < ApplicationRecord
  has_one :cart, dependent: :destroy

  #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving a payment
  def remove_whitespace
    self.payment_intent_id = self.payment_intent_id.strip
    self.receipt_url = self.receipt_url.strip
  end
end
