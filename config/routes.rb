Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :games, only: [:index, :show]

  get 'cart', to: 'carts#index'
  put 'cart', to: 'carts#create'
  delete 'cart', to: 'carts#destroy'

  get 'register', to: 'users#new'
  post 'users', to: 'users#create'
end
