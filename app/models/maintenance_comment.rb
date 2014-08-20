class MaintenanceComment < ActiveRecord::Base
  belongs_to :maintenance_request
  belongs_to :user
end
