class RemoveTypeToProductFoodAndDrink < ActiveRecord::Migration[6.1]
  def change
    remove_column :drinks, :type, :integer
    remove_column :foods, :type, :integer
    add_column :drinks, :category, :integer
    add_column :foods, :category, :integer
  end
end
