class Message < ApplicationRecord
  belongs_to :user
  belongs_to :product

  #Validations
  validates :message, length: {maximum: 100, too_long: "100 is the maximum number of caracter"}

  #Class method with eagle loading
  def self.get_my_messages(id)
    self.where(muted:false).order(created_at: :asc).includes(:product).where("products.user_id = ?", id).references(:product)
  end

  #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving a message
  def remove_whitespace
    self.message = self.message.strip
  end
   
end
