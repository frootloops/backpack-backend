FactoryGirl.define do
  factory :message_text, class: 'Message::Text' do
    body "Message body"
  end
end
