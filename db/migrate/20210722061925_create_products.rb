class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :condition
      t.string :title
      t.text :description
      t.float :price
      t.string :shipped_from
      t.integer :delivery_est
      t.integer :available
      t.integer :sold
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
