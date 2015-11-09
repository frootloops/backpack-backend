class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :message, polymorphic: true
  validates :conversation_id, presence: true
end
