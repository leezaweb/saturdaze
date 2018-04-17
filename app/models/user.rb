class User < ApplicationRecord
  has_many :rsvps
  has_many :events, foreign_key: :host_id
  has_many :commitments, foreign_key: :guest_id, class_name: 'Rsvp'
end
