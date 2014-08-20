class BuildingApartment < ActiveRecord::Base
  belongs_to :building
  belongs_to :apartment
end
