# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  DOB        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
