class AddConditionRefToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :condition, null: false, foreign_key: true
  end
end
