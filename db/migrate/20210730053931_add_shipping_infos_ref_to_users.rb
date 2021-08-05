class AddShippingInfosRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :shipping_infos, :user, foreign_key: true
  end
end
