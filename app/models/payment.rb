class Payment < ApplicationRecord
  has_one :cart, dependent: :destroy

  #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving a payment
  def remove_whitespace
    if payment_intent_id
    self.payment_intent_id = self.payment_intent_id.strip
    elsif receipt_url
    self.receipt_url = self.receipt_url.strip
    end
  end
end
