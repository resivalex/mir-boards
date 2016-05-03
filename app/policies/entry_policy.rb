class EntryPolicy
  attr_reader :current_user, :model

  def initialize(user, model)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @entry = model
  end

  def create?
    raise NotRiderError, "must be rider" unless @user.rider?
    true
  end

  def destroy?
    @user.admin || @entry.user == @user
  end
end
