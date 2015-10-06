class Device < ActiveRecord::Base
  belongs_to :traveler
  validates :uuid, :access_token, uniqueness: true
end
