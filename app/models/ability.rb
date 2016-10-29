class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new 
    
    if user.admin === true
      can :manage, Post
      can :manage, Category
      can :manage, Comment
    elsif user.confirmed?
      can :read, Post, :published => true
      can :search, Post
      can :read, Category
      can :read, Comment

      can :create, Comment, :post => { :published => true }
      can :update, Comment, :user => user
      can :destroy, Comment, :user => user
    else  
      can :read, Post, :published => true
      can :search, Post
      can :read, Category
      can :read, Comment
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
