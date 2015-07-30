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

class Book < ActiveRecord::Base
  attr_accessible :name, :year, :author_id, :subgenre_id, :publisher_id

  belongs_to :author, :inverse_of => :books
  belongs_to :subgenre, :inverse_of => :books
  belongs_to :publisher, :inverse_of => :books
  #delegate :genre, :to => :subgenre

  validates :name, :presence => true,
            :length => { :maximum => 200 }
  validates :year, :presence => true,
            :length => { :minimum => 1 , :maximum => 4}
  validates :author_id, :presence => true
  validates :subgenre_id, :presence => true
  validates :publisher_id, :presence => true

  def to_s
    name
  end

end
