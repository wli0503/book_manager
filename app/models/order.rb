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

end
