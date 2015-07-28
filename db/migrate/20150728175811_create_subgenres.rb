class CreateSubgenres < ActiveRecord::Migration
  def change
    create_table :subgenres do |t|
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
