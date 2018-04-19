class RsvpsController < ApplicationController
  def update


    rsvp = Rsvp.find(params[:id])
    if rsvp.is_commited == false || rsvp.is_commited.nil?
      rsvp.update(is_commited:true)
      redirect_to event_path(Rsvp.find(params[:id]).event_id)
    else
      rsvp.destroy

      flash[:message] = "Successfully declined invitation."

      redirect_to '/'
    end

  end
end
