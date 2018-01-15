Rails.application.routes.draw do
  root 'home#index'

  resources :restaurant
  resources :meadow
end
