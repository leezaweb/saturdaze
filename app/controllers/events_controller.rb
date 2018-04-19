class EventsController < ApplicationController
  before_action :require_login
  before_action :set_event, only: [:show,:edit,:update,:destroy]
  before_action :dates, only: [:edit,:new,:create]

  def index

  end

  def notice
    latest_invite = Rsvp.where(guest_id: current_user.id).order(created_at: :desc).limit(1)[0]
    if latest_invite
      invite_event = Event.find(latest_invite.event_id)
      flash[:message] = "#{invite_event.host.first_name} invited you to an event: #{invite_event.name}"
      redirect_to events_path
    end

      latest_event = Event.joins(:rsvps).where(host_id: current_user.id).order(created_at: :desc).limit(1)[0]
      latest_rsvp = Rsvp.find_by(event_id: latest_event.id, is_commited:true)
    if latest_event && latest_rsvp
      hosted_guest = User.find(latest_rsvp.guest_id)
      hosted_event = Event.find(latest_rsvp.event_id)
      flash[:message] = "#{hosted_guest.first_name} RSVPed to your event: #{hosted_event.name}"
      redirect_to events_path
    end
  end

  def all
    @events = Event.sort(params[:sort]) if params[:sort]
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

  def dates
    future_dates = make_date_array.select{|x| x > Date.today }
    available_dates = future_dates.select{|x| Event.all.pluck(:date).exclude?(x)}
    @dates = available_dates.map{|x|x.strftime('%B %e, %Y')}
  end

  def make_date_array
    strings = ["2018-04-14","2018-04-28","2018-05-05","2018-05-19","2018-05-26","2018-06-9","2018-06-16","2018-06-23","2018-07-07","2018-07-14","2018-07-21","2018-07-28","2018-08-04","2018-08-11","2018-08-18","2018-08-25","2018-09-01","2018-09-08","2018-09-15","2018-09-22","2018-09-29","2018-10-06","2018-10-13","2018-10-20","2018-10-27","2018-11-03","2018-11-10","2018-11-17","2018-11-24","2018-12-01","2018-12-08","2018-12-15","2018-12-22","2018-12-29"]

    strings.map do |string|
      string.split(",").map do |datestring|
        datearr = datestring.split("-").map{|x|x.to_i}
        Date.new(datearr[0],datearr[1],datearr[2])
      end
    end.flatten
  end

end
