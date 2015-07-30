class AddSubgenreIdToBook < ActiveRecord::Migration
  def change
    add_column :books, :subgenre_id, :integer
    add_column :books, :publisher_id, :integer
    add_index :books, :subgenre_id
    add_index :books, :publisher_id
  end
end
