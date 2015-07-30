# == Schema Information
#
# Table name: subgenres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  genre_id   :integer
#

require 'test_helper'

class SubgenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
