class Event < ApplicationRecord
  has_many :event_amenities
  has_many :amenities, through: :event_amenities
  has_many :rsvps
  has_many :guests, class_name: 'User', through: :rsvps
  belongs_to :host, class_name: 'User'
  belongs_to :location

end
