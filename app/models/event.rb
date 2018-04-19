class Event < ApplicationRecord
  has_many :event_amenities
  has_many :amenities, through: :event_amenities
  has_many :rsvps
  has_many :guests, class_name: 'User', through: :rsvps
  belongs_to :host, class_name: 'User'
  belongs_to :location

  validates :name, :description, :location_id, :host_id, presence: true

  include PublicActivity::Model
  tracked


end
