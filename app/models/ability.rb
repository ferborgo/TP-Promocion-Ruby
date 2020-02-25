class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Author
    can :read, Recommendation
    can :read, Book
    
    if user.is_admin
      can :manage, Author
      can :manage, Book
      can :manage, Genre
    end

    if user.is_public
      can :manage, Opinion
      can :manage, Recommendation
    end
  end
end
