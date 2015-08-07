# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  year         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  author_id    :integer
#  subgenre_id  :integer
#  publisher_id :integer
#  price        :float
#

class Book < ActiveRecord::Base
  attr_accessible :name, :year, :author_id, :subgenre_id, :publisher_id, :price, :genre_id

  belongs_to :author, :inverse_of => :books
  belongs_to :subgenre, :inverse_of => :books
  belongs_to :genre, :inverse_of=> :books
  belongs_to :publisher, :inverse_of => :books
  has_many :order_details, :inverse_of => :book, :dependent => :destroy
  has_many :price_histories, :inverse_of => :book, :dependent => :destroy
  has_many :reviews, :inverse_of => :book, :dependent => :destroy

  #delegate :genre, :to => :subgenre

  validates :name, :presence => true,
            :length => { :maximum => 200 }
  validates :year, :presence => true,
            :length => { :minimum => 1 , :maximum => 4}
  validates :author_id, :presence => true
  validates :subgenre_id, :presence => true
  validates :publisher_id, :presence => true
  validates :price, :presence => true,
                    :numericality => true

  before_save :record_old_price

  before_save do |rec|
    if rec.subgenre_id_changed?
      rec.genre_id = rec.subgenre.genre_id
    end
  end

  after_save :invalid_books_in_genre_cache
  after_destroy :invalid_books_in_genre_cache

  after_save :invalid_books_in_subgenre_cache
  after_destroy :invalid_books_in_subgenre_cache

  def invalid_books_in_genre_cache
    Rails.cache.delete(genre.count_books_in_genre_key)
  end

  def invalid_books_in_subgenre_cache
    Rails.cache.delete(subgenre.count_books_in_subgenre_key)
  end

  def avg_rating_cache_key
    "book.#{id}.avg_rating"
  end

  def avg_rating
    Rails.cache.fetch(avg_rating_cache_key) do
      reviews.average(:rating)
    end
  end

  def total_volume_sold_cache_key
    "book.#{id}.total_volume"
  end

  def total_volume_sold
    Rails.cache.fetch(total_volume_sold_cache_key) do
      self.order_details.sum(:quantity)
    end
  end

  def to_s
    name
  end

  private

  def record_old_price
    if(!(new_record?) && price_changed?)
      PriceHistory.create(:book_id => self.id, :old_price => price_was, :new_price => price)
    end
    true
  end

end
