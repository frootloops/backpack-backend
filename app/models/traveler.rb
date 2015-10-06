class Traveler < ActiveRecord::Base
  has_one_time_password length: 4
  devise :database_authenticatable

  has_many :devices
  validates :mobile_number, uniqueness: true, phone: true
end
