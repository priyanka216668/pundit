class PostPolicy < ApplicationPolicy
  # include ApplicationHelper

  # def index?
  #   return true if  user.admin?
  # end

  #commented to show not authorized error
  def create?
    # user.present?
     false
  end

  def update?
    user.present? && user == post.user
  end

  def destroy?
    return true if user.present? && user.admin?
    user.present? && user == post.user
  end



  class Scope < Scope
    def resolve
      if user.present? 
        if user.admin?
          scope.where(status: "published").or(scope.where(user_id: user.id))
        else
          scope.where(user_id: user.id)

        end
      else
        scope.where(status: "published")
      end
    end
  end


  private

  def post
    record
  end
end