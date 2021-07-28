class AddPaymentRefToCart < ActiveRecord::Migration[6.1]
  def change
    add_reference :carts, :payment, null: false, foreign_key: true
  end
end
