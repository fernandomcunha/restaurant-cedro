Rails.application.routes.draw do
  root 'home#index'

  resources :restaurants
  resources :meadows
end
