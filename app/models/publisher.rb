# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Publisher < ActiveRecord::Base
  attr_accessible :name, :desc

  #has_many :book

  validates :name, :presence => true,
      :length => { :maximum => 200}

  validates :desc, :presence => true,
      :length => { :maximum => 200}

end
