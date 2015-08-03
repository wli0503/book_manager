class ChangeCurrentPriceToPriceBooks < ActiveRecord::Migration
  def change
    remove_column :books, :current_price;
    add_column :books, :price, :float;
  end
end
