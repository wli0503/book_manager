# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  year       :string(255)
#  author     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
