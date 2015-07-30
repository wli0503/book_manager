class AddGenreIdToSubgenre < ActiveRecord::Migration
  def change
    add_column :subgenres, :genre_id, :integer
    add_index :subgenres, :genre_id
  end
end
