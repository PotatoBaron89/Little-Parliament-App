class AddMealCategoryToFood < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :meal_category, :integer
  end
end
