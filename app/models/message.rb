class Message < ActiveRecord::Base
  belongs_to :conversation
  validates :body, :conversation_id, presence: true
end
