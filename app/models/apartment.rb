class Apartment < ActiveRecord::Base
  belongs_to :building
  has_many :users
  has_many :maintenance_requests
  attr_accessible :unit, :bedrooms, :bathrooms, :floorplan, :image, :building_id, :user_ids

  validates :unit, presence: true
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true
  validates :building, presence: true

  def apartment_label_method
    "#{self.building.name} #{self.unit}"
  end
end
