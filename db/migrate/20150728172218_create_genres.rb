class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
