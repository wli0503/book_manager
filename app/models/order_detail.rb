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

  after_save :calculate_total
  after_destroy :calculate_total

  private
  def calculate_total
    @total = 0
    @all_order_detail = OrderDetail.all
    @all_order_detail.each do |od|
      @total += od.quantity * od.unit_price
    end
    @order_to_be_updated = Order.find(self.order_id)
    @order_to_be_updated.update_attribute(:total_price, @total)
    true
  end

end
