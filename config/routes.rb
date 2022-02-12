Rails.application.routes.draw do
	
  resources :orders
	resources :sessions, only: [:create, :logged_in]
	resources :registrations, only: [:create]

	delete :logout, to: "sessions#logout"
	get :logged_in, to: "sessions#logged_in"

  resources :users
  resources :products
  resources :foods
  resources :drinks


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
