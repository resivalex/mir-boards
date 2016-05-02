class VisitorsController < ApplicationController
  def index
    @riders = User.rider
  end
end
