class Reader < ActiveRecord::Base
  attr_accessible :name

  has_many :reviews, :inverse_of => :reader, :dependent => :destroy
  
end
