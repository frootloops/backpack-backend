class Traveler < ActiveRecord::Base
  acts_as_token_authenticatable
  has_one_time_password length: 4
  devise :database_authenticatable, authentication_keys: [:phone]
  validates :phone, uniqueness: true, phone: true, allow_blank: true
  validates :device_token, uniqueness: true, presence: true
end
