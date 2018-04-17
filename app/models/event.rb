class Event < ApplicationRecord
  has_many :rsvps
  has_many :guests, class_name: 'User', through: :rsvps
  belongs_to :host, class_name: 'User'

  belongs_to :location
end
