class NominationsController < ApplicationController
  def index
    @nominations = Nomination.all
  end

  def show
    @nomination = Nomination.find params[:id]
  end
end
