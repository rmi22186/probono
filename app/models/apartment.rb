class Apartment < ActiveRecord::Base
  belongs_to :building
  attr_accessible :unit, :bedrooms, :bathrooms, :floorplan, :image
end
