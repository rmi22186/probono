class MaintenanceRequest < ActiveRecord::Base
  belongs_to :user
  has_many :maintenance_comments
end
