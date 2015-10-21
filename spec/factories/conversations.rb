FactoryGirl.define do
  factory :conversation do
    traveler { create(:traveler) }
    title "Chat #1"
  end
end
