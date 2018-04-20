class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user


  def clear_notice
    flash[:message] = ""
  end

  def notice
    latest_invite = Rsvp.where(is_commited:nil, guest_id: current_user.id).order(created_at: :desc)
    invite_event = latest_invite.map {|x| Event.find_by(id:x.event_id)}.compact
    flash[:message] = ""
    if invite_event.any?
      invite_event.each do |x|
        flash[:message] << "#{x.host.first_name} invited you to an event: #{x.name}<br>"
      end
    end

    latest_event = Event.where(host_id: current_user.id).order(created_at: :desc)
    latest_rsvp = latest_event.map{|x|Rsvp.find_by(event_id: x.id, is_commited:true)}.compact
    if latest_rsvp.any?
      latest_rsvp.each do |x|
        hosted_guest = User.find(x.guest_id)
        hosted_event = Event.find(x.event_id)
        flash[:message] << "#{hosted_guest.first_name} RSVPed to your event: #{hosted_event.name}<br>"
      end
    end
    # redirect_to events_path
  end

  include SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def authorize
    redirect_to '/login' unless current_user
  end

end
