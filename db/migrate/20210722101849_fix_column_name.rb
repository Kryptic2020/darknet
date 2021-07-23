class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :available, :quantity_available
    rename_column :products, :delivery_est, :delivery_estimated
  end
end
