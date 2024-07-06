# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    return unless user.present?

    can :create, Year
    can [:read, :update, :delete], Year do |year|
      year.user_id == user.id
    end

    can :create, CourseModule
    can [:read, :update, :delete], CourseModule do |course_module|
      year = Year.find(course_module.year_id)
      year.user_id == user.id
    end

    can :create, Test
    can [:read, :update, :delete], Test do |test|
      Year.find(CourseModule.find(test.course_module_id).year_id).user_id == user.id
    end

    #
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
