Rails.application.routes.draw do
  resources :hauntings
  resources :haunted_houses, path: 'haunted-houses'
  resources :ghosts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
