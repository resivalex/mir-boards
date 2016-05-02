class RidersController < ApplicationController
  def index
    @riders = User.rider
  end

  def show
    @rider = User.rider.find(params[:id])
  end
end
