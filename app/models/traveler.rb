class Traveler < ActiveRecord::Base
  has_one_time_password counter_based: true
  devise :database_authenticatable

  has_many :devices
  validates :mobile_number, uniqueness: true, phone: true
end
