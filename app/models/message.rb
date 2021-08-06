class Message < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def self.get_my_messages(id)
    self.where(muted:false).order(created_at: :asc).includes(:product).where("products.user_id = ?", id).references(:product)
  end
   
end
