class User < ActiveRecord::Base
  attr_accessible :created, :email, :name, :password
end