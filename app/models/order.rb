# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  total_price   :float
#  customer_name :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Order < ActiveRecord::Base

  attr_accessible :total_price, :customer_name, :created_at

  has_many :order_details, :inverse_of => :order, :dependent => :destroy

  validates :total_price, :numericality => true
  validates :customer_name, :presence => true,
              :length => { :maximum => 200 }

  after_create do |rec|
    rec.calculate_total
  end

  def calculate_total
    total = 0
    order_details.each do |od|
      total += od.quantity * od.unit_price
    end
    update_attributes(:total_price => total)
    true
  end

end
