Rails.application.routes.draw do
  resources :messages
  resources :rooms

  root "rooms#first_room"
end