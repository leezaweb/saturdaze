class Location < ApplicationRecord
  has_many :events
  validates :name, :address, :description, presence: true

end
