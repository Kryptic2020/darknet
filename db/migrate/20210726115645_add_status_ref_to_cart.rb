class AddStatusRefToCart < ActiveRecord::Migration[6.1]
  def change
    add_reference :carts, :status, null: false, foreign_key: true
  end
end
