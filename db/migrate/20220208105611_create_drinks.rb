class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
