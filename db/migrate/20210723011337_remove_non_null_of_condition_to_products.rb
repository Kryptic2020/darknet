class RemoveNonNullOfConditionToProducts < ActiveRecord::Migration[6.1]
  
  def up
    change_column_null :products, :condition, :null => true
  end

  def down
    change_column_null :products, :condition, :null => false
  end
end

