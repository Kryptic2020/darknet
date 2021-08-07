class CreateShippingInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_infos do |t|
      t.integer :street_number
      t.string :unit
      t.string :street_name
      t.string :suburb
      t.integer :phone
      t.integer :postcode

      t.timestamps
    end
  end
end
