class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :maintenance_requests
  has_many :maintenance_comments

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :approved, :apartment_validation, :role, :active

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

  private 

end
