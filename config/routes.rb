Rails.application.routes.draw do

  root "static_pages#index"

  resources :static_pages
  resources :tournaments
  resources :draws
  resources :matches
  resources :locations
end
