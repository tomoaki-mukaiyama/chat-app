Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :users
  
  root "rooms#index"
  get '/show_additionally', to: 'rooms#show_additionally'
end