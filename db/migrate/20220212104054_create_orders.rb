class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true

      t.text :order_summary
      t.decimal :total
      t.decimal :savings

      t.datetime :order_date
      t.datetime :dispatch_date

      t.timestamps
    end
  end
end
