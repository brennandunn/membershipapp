class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :view, :member if user.has_role? :member
      can :read, CourseModule do |course_module|
        user.can_view?(course_module)
      end
    end
  end
end