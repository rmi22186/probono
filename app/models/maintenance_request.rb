class MaintenanceRequest < ActiveRecord::Base
  include Filterable

  belongs_to :user
  belongs_to :apartment
  has_many :maintenance_comments
  scope :status, -> (status) { where status: status }

  attr_accessible :status, :priority, :description, :title, :email_updates, :user, :apartment

  validates :title, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 20 }, presence: true
  validates :user, presence: true

end
