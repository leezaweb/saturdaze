class User < ApplicationRecord
  has_many :rsvps
  has_many :events, foreign_key: :host_id
  has_many :commitments, foreign_key: :guest_id, class_name: 'Rsvp'
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, :password, presence: true

  has_secure_password

  def fullname
    "#{self.first_name} #{self.last_name}"
  end
end
