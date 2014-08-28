class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :tenant
      can :manage, MaintenanceRequest, apartment_id: user.apartment_id
      can :manage, MaintenanceComment, user_id: user.id
    end

    if user.role? :landlord
    end

    if user.role? :admin
      can :manage, :all
    end
    
  end
end
