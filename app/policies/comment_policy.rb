class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    user == comment.user
  end
end
