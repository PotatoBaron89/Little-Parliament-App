class AddTypeToProductFoodAndDrink < ActiveRecord::Migration[6.1]
  def change
    add_column :drinks, :type, :integer
    add_column :foods, :type, :integer
  end
end
