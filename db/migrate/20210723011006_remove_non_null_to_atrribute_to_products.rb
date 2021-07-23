class RemoveNonNullToAtrributeToProducts < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :condition, :string
  end
end
