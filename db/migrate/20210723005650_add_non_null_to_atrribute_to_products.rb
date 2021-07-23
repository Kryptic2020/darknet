class AddNonNullToAtrributeToProducts < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :condition, :string, :null => false
    change_column :products, :title, :string, :null => false
    change_column :products, :description, :text, :null => false
    change_column :products, :condition, :string
    change_column :products, :price, :float, :null => false, precision: 2
    change_column :products, :shipped_from, :string, :null => false
    change_column :products, :delivery_estimated, :integer, :null => false
    change_column :products, :quantity_available, :integer, :null => false    
  end
end
