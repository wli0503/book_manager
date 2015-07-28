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

class Book < ActiveRecord::Base
  attr_accessible :name, :year, :author_id

  belongs_to :author, :inverse_of => :books
  belongs_to :subgenre, :inverse_of => :books
  delegate :genre, :to => :subgenre

  validates :name, :presence => true,
            :length => { :maximum => 200 }
  validates :year, :presence => true,
            :length => { :minimum => 1 , :maximum => 4}
  validates :author_id, :presence => true

  def to_s
    name
  end

end
