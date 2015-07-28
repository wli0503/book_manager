# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Genre < ActiveRecord::Base
  attr_accessible :name, :desc

  #has_many :subgenre
  has_many :book

  validates :name, :presence => true,
      :length => { :maximum => 200}

  validates :desc, :presence => true,
      :length => { :maximum => 200}
end
