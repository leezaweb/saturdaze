class EventsController < ApplicationController
  before_action :require_login
  before_action :set_event, only: [:show,:edit,:update,:destroy]

  def index
    @activities = PublicActivity::Activity.order("created_at DESC").where(trackable_type: "Event", trackable_id: 35).all
  end

  def all
    if params[:sort]

      case params[:sort]
      when "name"
        @events = Event.all.order("name")
      when "location"
        @events = Event.joins(:location).order("locations.name")
      when "host"
        @events = Event.joins(:host).order("users.first_name")
      # when "guest count"
      #   @events = Event.joins(:rsvps).group("rsvps.event_id").order("count(guest_id)")
      # when "amenity count"
      #   @events = Event.joins(:event_amenities).group("event_amenities.event_id").order("count(amenity_id)")
      when "guest"
        @events = Event.select('*').joins(:rsvps).group("rsvps.event_id").select("count(guest_id) as sort").order("sort")
      when "amenity"
        @events = Event.select('*').joins(:event_amenities).group("event_id").select("count(amenity_id) as sort").order("sort")
      end

    else
      @events = Event.all
    end
  end

  def new
    @event = Event.new
  end

  def create

    @event = Event.create(event_params)

    if @event.valid?
      flash[:message] = "Successfully created event."

      redirect_to events_path
    else
      render :new
    end
  end


  def update

    @event.update(event_params)
    if @event.valid?

      flash[:message] = "Successfully updated event."
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
      flash[:message] = "Successfully deleted event."
    redirect_to manage_events_path
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
    params.require(:event).permit(Event.column_names, guest_ids:[], amenity_ids:[])
  end

end
