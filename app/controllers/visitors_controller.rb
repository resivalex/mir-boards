class VisitorsController < ApplicationController
  def index
    @riders = User.rider
    @nominations = Nomination.all
    @events = Event.all
  end
end
