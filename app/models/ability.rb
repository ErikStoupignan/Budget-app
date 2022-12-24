class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Group, user: user
    can :manage, Movement, user:
  end
end
