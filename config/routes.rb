Rails.application.routes.draw do
  devise_for :travelers
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'bonjour', to: 'bonjour#create'
      get 'bonjour/check', to: 'bonjour#check'
      post 'bonjour/code', to: 'bonjour#code'
    end
  end
end
