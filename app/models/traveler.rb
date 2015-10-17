class Traveler < ActiveRecord::Base
  has_one_time_password length: 4
  devise :database_authenticatable, authentication_keys: [:phone]
  validates :phone, uniqueness: true, phone: true
  acts_as_token_authenticatable
end
