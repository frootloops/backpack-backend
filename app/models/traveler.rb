class Traveler < ActiveRecord::Base
  has_one_time_password length: 4
  devise :database_authenticatable
  validates :phone, uniqueness: true, phone: true
  acts_as_token_authenticatable
end
