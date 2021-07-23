class AddSoldToProducts < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :sold, :integer, default: 0
  end
end
