class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :maintenance_requests
  has_many :maintenance_comments
  belongs_to :apartment
  before_create :set_tenant

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :approved, :apartment_validation, :role, :active, :emergency_contact_name, :emergency_contact_phone, :emergency_contact_relationship, :apartment_id, :apartment

  ROLES = %w[tenant landlord admin]

  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else  
      super
    end
  end

  def user_label_method
    "#{self.first_name} #{self.last_name}"
  end

  private 

  def set_tenant
    self.role = 'tenant'
  end

end
