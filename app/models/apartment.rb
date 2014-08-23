class Apartment < ActiveRecord::Base
  belongs_to :building
  has_many :users
  attr_accessible :unit, :bedrooms, :bathrooms, :floorplan, :image, :building_id, :user_ids

  def apartment_label_method
    "#{self.building.name} #{self.unit}"
  end
end
