class MaintenanceRequest < ActiveRecord::Base
  belongs_to :user
  has_many :maintenance_comments

  attr_accessible :status, :priority, :description, :title, :email_updates

end
