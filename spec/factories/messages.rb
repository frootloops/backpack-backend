FactoryGirl.define do
  factory :message do
    conversation { create(:conversation) }
    body "Message body"
  end
end
