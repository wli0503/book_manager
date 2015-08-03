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

require 'test_helper'

class OrderDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
