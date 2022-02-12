class AddSaleToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :sale_percent, :integer
  end
end
