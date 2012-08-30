class Category < ActiveRecord::Base
  attr_accessible :description, :name, :parent_id
  
  validates_length_of :name, :in => 4..50
  
  validates_length_of :description, :maximum => 200
end
