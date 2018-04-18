class Amenity < ApplicationRecord
  has_many :event_amenities
  has_many :events, through: :event_amenities

  validates :name, :price, :description, presence: true

  def price_change
    sprintf("%0.02f", self.price_in_cents/100.00).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end
end
