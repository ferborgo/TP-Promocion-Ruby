class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.is_admin
      can :manage, Author
      can :manage, Book
    end
  end
end
