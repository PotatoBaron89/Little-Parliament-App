Rails.application.routes.draw do
  resources :users
  resources :products
  resources :foods
  resources :drinks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
