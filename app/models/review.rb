class Review < ActiveRecord::Base
  attr_accessible :reader_id, :book_id, :rating
  
  belongs_to :reader, :inverse_of => :reviews
  belongs_to :book, :inverse_of => :reviews

  after_save :expire_book_cache
  after_destroy :expire_book_cache

  def expire_book_cache
    Rails.cache.delete(book.avg_rating_cache_key)
    true
  end
end
