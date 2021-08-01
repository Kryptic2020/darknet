class RemovePaymentIntentFromCart < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :payment_intent, :string
    remove_column :carts, :receipt_url, :string
  end
end
