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

class Author < ActiveRecord::Base
  has_many :books, :inverse_of => :author, :dependent => :destroy

  attr_accessible :first_name, :last_name, :DOB, :name

  validates :first_name, :presence => true,
      :length => { :maximum => 100}
  validates :last_name, :presence => true,
      :length => { :maximum => 100}
  validates :DOB, :presence => true,
      :length => { :is => 10}

  def name
    "#{first_name} #{last_name}"
  end

  def name=(n)
    x,y = n.split(' ')
    self.first_name = x
    self.last_name = y
    self.first_name && self.last_name
  end

  def to_s
    name
  end


end
