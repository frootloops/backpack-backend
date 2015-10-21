class Conversation < ActiveRecord::Base
  belongs_to :traveler
  validates :title, :traveler_id, presence: true
end
