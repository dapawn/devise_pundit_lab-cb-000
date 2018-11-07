class UserPolicy < ApplicationPolicy

  def initialize(current_user, record)
    @current_user = current_user
    @record = record
  end

  def create?
    @current_user.admin? || @record == @current_user
  end

  def show?
    @record == @current_user || @current_user.admin?
  end

  def update?
    @current_user.admin? || @record.try(:id) == @current_user.id
  end

  def index?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end

end

