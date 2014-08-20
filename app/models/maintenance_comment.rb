class MaintenanceComment < ActiveRecord::Base
  belongs_to :maintenancerequest
  belongs_to :user
end
