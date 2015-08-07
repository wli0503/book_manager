# == Schema Information
#
# Table name: subgenres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  genre_id   :integer
#

class Subgenre < ActiveRecord::Base

  attr_accessible :name, :desc, :genre_id

  has_many :books, :inverse_of => :subgenre, :dependent => :destroy
  belongs_to :genre, :inverse_of => :subgenres

  validates :name, :presence => true,
      :length => { :maximum => 200}

  validates :desc, :presence => true,
      :length => { :maximum => 200}

  validates :genre_id, :presence => true

  def count_books_in_subgenre_key
    "subgenre_#{id}_total_books"
  end


  def count_books_in_subgenre
    Rails.cache.fetch(count_books_in_subgenre_key) do
      self.books.count
    end
  end

end
