# == Schema Information
#
# Table name: price_histories
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  old_price  :float
#  new_price  :float
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class PriceHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
