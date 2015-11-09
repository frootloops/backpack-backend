FactoryGirl.define do
  factory :conversation do
    traveler { create(:traveler) }
    title { "Conversation with #{traveler.name}" }
  end
end
