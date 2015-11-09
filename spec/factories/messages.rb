FactoryGirl.define do
  factory :message do
    conversation { create(:conversation) }
    message { create(:message_text) }
  end
end
