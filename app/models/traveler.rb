class Traveler < ActiveRecord::Base
  has_one_time_password counter_based: true
  devise :database_authenticatable

  validates_uniqueness_of :mobile_number
  validates :mobile_number, phone: true
end
