class User < ApplicationRecord
  has_many :rsvps
  has_many :events, foreign_key: :host_id
  has_many :commitments, foreign_key: :guest_id, class_name: 'Rsvp'
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, presence: true

  has_secure_password

  include PublicActivity::Model
  # tracked owner: Proc.new{ |controller, model| controller.current_user }

  def fullname
    "#{self.first_name} #{self.last_name}"
  end
end
