FactoryGirl.define do
  factory :traveler do
    name "Arsen Gasparyan"
    email "to.arsen.gasparyan@gmail.com"
    phone "+79999808630"
    device_token { SecureRandom.uuid }
    authentication_token { SecureRandom.uuid }
    push_token { SecureRandom.uuid }
  end
end
