# config/initializers/pundit.rb
# Extends the ApplicationController to add Pundit for authorization.
# Modify this file to change the behavior of a 'not authorized' error.
# Be sure to restart your server when you modify this file.

class NotRiderError < Exception
end

module PunditHelper
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from NotRiderError, with: :user_not_rider
  end

  private

  def user_not_authorized
    flash[:alert] = current_user ? 'Недостаточно прав' : 'Необходимо авторизоваться'
    redirect_to (request.referrer || root_path)
  end

  def user_not_rider
    flash[:alert] = 'Только райдер может выполнить это действие'
    redirect_to (request.referrer || root_path)
  end

end

ApplicationController.send :include, PunditHelper
