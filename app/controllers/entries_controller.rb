class EntriesController < ApplicationController
  def create
    entry = Entry.new
    authorize entry
    entry.user = User.find params[:user_id]
    entry.event = Event.find params[:event_id]
    if entry.save
      flash[:notice] = 'Ваша заявка принята'
    end
    redirect_to :back
  end

  def destroy
    if Entry.find(params[:id]).destroy
      flash[:notice] = 'Ваша заявка отменена'
    end
    redirect_to :back
  end
end
