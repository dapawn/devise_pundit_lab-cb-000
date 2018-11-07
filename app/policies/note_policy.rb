class NotePolicy < ApplicationPolicy

  def initialize(user, note)
    @user = user
    @note = note
  end

  def create?
    @user.admin? || @note.try(:user) == @user
  end

  def read?
    @user.admin? || @user.moderator? || @note.try(:user) == @user || @note.try(:viewer) == @user
  end

  def update?
    @user.admin? || @note.try(:user) == @user
  end

  def destroy?
    @user.admin? || @note.try(:user) == @user
  end

end

