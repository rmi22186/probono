class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :tenant
    end

    if user.role? :landlord
    end

    if user.role? :admin
        can :manage, :all
    end

    
  end
end
