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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
