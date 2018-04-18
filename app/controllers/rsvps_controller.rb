class RsvpsController < ApplicationController
  def update
    

    rsvp = Rsvp.find(params[:id])
    if rsvp.is_commited == false || rsvp.is_commited.nil?
      rsvp.update(is_commited:true)
    else
      rsvp.update(is_commited:false)
    end
    redirect_to event_path(Rsvp.find(params[:id]).event_id)

  end
end
