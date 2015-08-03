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

class PriceHistory < ActiveRecord::Base

  attr_accessible :book_id, :old_price, :new_price
  belongs_to :book, :inverse_of => :price_histories

  validates :book_id, :presence => true
  validates :old_price, :presence => true,
              :numericality => true
  validates :new_price, :presence => true,
              :numericality => true

end
