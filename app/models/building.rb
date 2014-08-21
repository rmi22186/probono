class Building < ActiveRecord::Base
  has_many :apartments
  attr_accessible :street, :city, :state, :zip
end
