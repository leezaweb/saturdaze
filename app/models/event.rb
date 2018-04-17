class Event < ApplicationRecord
  has_many :rsvps
  has_many :guests, class_name: 'User', through: :rsvps
  belongs_to :host, class_name: 'User'

  accepts_nested_attributes_for :guests

end
