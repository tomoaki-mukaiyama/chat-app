Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :users
  
  root "rooms#first_room"
end