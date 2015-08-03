class CreatePriceHistories < ActiveRecord::Migration
  def change
    create_table :price_histories do |t|
      t.integer :book_id
      t.float :old_price
      t.float :new_price

      t.timestamps
    end
    add_index :price_histories, :book_id
  end
end
