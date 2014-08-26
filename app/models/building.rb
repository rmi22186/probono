class Building < ActiveRecord::Base
  has_many :apartments
  attr_accessible :street, :city, :state, :zip, :name, :apartment_ids

  validates :street, length: { minimum: 2 }, presence: true
  validates :city, length: { minimum: 2 }, presence: true
  validates :state, length: { minimum: 2 }, presence: true
  validates :zip, length: { minimum: 5 }, presence: true
  validates :name, length: { minimum: 3 }, presence: true

end
