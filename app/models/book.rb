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
#  price        :float
#

class Book < ActiveRecord::Base
  attr_accessible :name, :year, :author_id, :subgenre_id, :publisher_id, :price

  belongs_to :author, :inverse_of => :books
  belongs_to :subgenre, :inverse_of => :books
  belongs_to :publisher, :inverse_of => :books
  has_many :order_details, :inverse_of => :book, :dependent => :destroy
  has_many :price_histories, :inverse_of => :book, :dependent => :destroy
  #delegate :genre, :to => :subgenre

  validates :name, :presence => true,
            :length => { :maximum => 200 }
  validates :year, :presence => true,
            :length => { :minimum => 1 , :maximum => 4}
  validates :author_id, :presence => true
  validates :subgenre_id, :presence => true
  validates :publisher_id, :presence => true
  validates :price, :presence => true,
                    :numericality => true

  before_save :record_old_price

  def to_s
    name
  end

  private

  def record_old_price
    if(!(self.new_record?) && self.price_changed?)
      PriceHistory.create(:book_id => self.id, :old_price => self.price_was, :new_price => self.price)
    end
  end

end
