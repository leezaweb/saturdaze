class EventAmenity < ApplicationRecord
  belongs_to :event
  belongs_to :amenity
end
