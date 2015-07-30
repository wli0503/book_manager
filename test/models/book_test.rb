# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  year         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  author_id    :integer
#  subgenre_id  :integer
#  publisher_id :integer
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
