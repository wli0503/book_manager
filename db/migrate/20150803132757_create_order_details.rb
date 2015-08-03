class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :book_id
      t.integer :order_id
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end
    add_index :order_details, :book_id;
    add_index :order_details, :order_id;
  end
end
