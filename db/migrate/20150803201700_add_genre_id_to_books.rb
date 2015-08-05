class AddGenreIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :genre_id, :integer

    add_index :books, :genre_id
  end
end
