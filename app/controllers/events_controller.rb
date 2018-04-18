class EventsController < ApplicationController
  before_action :require_login
  before_action :set_event, only: [:show,:edit,:update,:destroy]

  def create
    @event = Event.create(event_params)
    if @event.valid?
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.valid?
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end


  private

  def require_login
    redirect_to '/login' and return unless session.include? :user_id
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    puts params
    params.require(:event).permit(Event.column_names, guest_ids: [], amenity_ids: [])
  end

end
