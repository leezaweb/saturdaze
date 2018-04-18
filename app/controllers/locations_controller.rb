class LocationsController < ApplicationController
  #before_action :require_login
  before_action :set_location, only: [:show,:edit,:update,:destroy]

  def index
    @locations = Location.all

  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    if @location.valid?
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def update
    @location.update(location_params)
    if @location.valid?
      redirect_to location_path
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    puts params
    params.require(:location).permit(Location.column_names)
  end
end
