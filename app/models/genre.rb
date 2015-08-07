# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Genre < ActiveRecord::Base
  attr_accessible :name, :desc

  has_many :subgenres, :inverse_of => :genre, :dependent => :destroy
  has_many :books, :inverse_of=> :genre, :dependent => :destroy

  validates :name, :presence => true,
      :length => { :maximum => 200}

  validates :desc, :presence => true,
      :length => { :maximum => 200}


  def count_books_in_genre_key
    "genre_#{id}_total_books"
  end

        
  def count_books_in_genre
    Rails.cache.fetch(count_books_in_genre_key) do
      self.books.count
    end
  end


end
