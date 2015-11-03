Rails.application.routes.draw do
  root to: "api/v1/bonjour#check"
  devise_for :travelers
  get "/websocket", to: ActionCable.server
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'bonjour', to: 'bonjour#create'
      get 'bonjour/check', to: 'bonjour#check'
      post 'bonjour/code', to: 'bonjour#code'
    end
  end
end
