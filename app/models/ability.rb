class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.is_admin
      can :manage, Author
      can :manage, Book
    end

    if user.is_public
      can :manage, Opinion
      can :manage, Recommendation
    end
  end
end
