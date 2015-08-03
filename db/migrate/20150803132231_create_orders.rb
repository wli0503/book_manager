class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total_price
      t.string :customer_name

      t.timestamps
    end
    add_index :orders, :customer_name
  end
end
