class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reader_id
      t.integer :book_id
      t.integer :rating
      t.timestamps
    end
    add_index :reviews, [:reader_id, :book_id, :rating]
  end
end
