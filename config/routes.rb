Rails.application.routes.draw do
  get "homes/about"
  devise_for :users
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: [:show, :edit ,:index ,:update]
end
