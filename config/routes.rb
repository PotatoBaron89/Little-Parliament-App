Rails.application.routes.draw do
	
	resources :sessions, only: [:create, :logged_in]
	resources :registrations, only: [:create]

	delete :logout, to: "sessions#logout"
	get :logged_in, to: "sessions#logged_in"

	get :status, to: "static#home"

  resources :users
  resources :products
  resources :foods
  resources :drinks

	# Upcoming feature, closed endpoint for now
  # resources :orders

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
