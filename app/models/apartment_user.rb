class ApartmentUser < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :user

  attr_accessible :apartment_id, :user_id, :lease_start, :lease_end, :active
end
