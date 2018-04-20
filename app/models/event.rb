class Event < ApplicationRecord
  has_many :event_amenities
  has_many :amenities, through: :event_amenities
  has_many :rsvps
  has_many :guests, class_name: 'User', through: :rsvps
  belongs_to :host, class_name: 'User'
  belongs_to :location

  validates :name, :description, :location_id, :date, :host_id, presence: true

  def self.sort(order)
     events ||= Event.all

    case order
      when "name"
        events = events.sort_by{|x|x.name.downcase}
      when "date"
        events = events.sort_by{|x|x.date}
      when "location"
        events = events.sort_by{|x|x.location.name.downcase}
      when "host"
        events = events.sort_by{|x|x.host.first_name.downcase}
      when "guest"
        events = events.sort_by{|x|x.guests.count}
      when "amenity"
        events = events.sort_by{|x|x.amenities.count}
    end

  end

end
