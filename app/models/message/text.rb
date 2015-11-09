class Message::Text < ActiveRecord::Base
  validates :body, presence: true
end
