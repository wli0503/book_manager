# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  order_id   :integer
#  quantity   :integer
#  unit_price :float
#  created_at :datetime
#  updated_at :datetime
#

class OrderDetail < ActiveRecord::Base

  attr_accessible :book_id, :order_id, :quantity, :unit_price

  belongs_to :book, :inverse_of => :order_details
  belongs_to :order, :inverse_of => :order_details

  validates :book_id, :presence => true
  validates :order_id, :presence => true
  validates :quantity, :presence => true
  validates :unit_price, :presence => true,
              :numericality => true

  after_save :calculate_total, :expire_book_cache
  after_destroy :calculate_total, :expire_book_cache

  private

  def calculate_total
    order.calculate_total
    true
  end

  def expire_book_cache
    Rails.cache.delete(book.total_volume_sold_cache_key)
    true
  end

end
