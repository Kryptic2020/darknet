class CreateUserContactInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_contact_infos do |t|
      t.integer :street_number
      t.string :unit
      t.string :street_name
      t.string :suburb
      t.string :phone
      t.string :postcode

      t.timestamps
    end
  end
end
