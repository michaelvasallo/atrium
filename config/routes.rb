Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'games#index'

  get 'games/(:genre)', to: 'games#index', as: :games
  get 'game/:id', to: 'games#show', as: :game

  get 'cart', to: 'carts#index'
  put 'cart', to: 'carts#create'
  delete 'cart', to: 'carts#destroy'

  get 'order/:id', to: 'orders#show', as: :order
  get 'checkout', to: 'orders#new'
  post 'checkout', to: 'orders#create'

  get 'payment', to: 'charges#new'
  post 'payment', to: 'charges#create'

  get 'register', to: 'users#new'
  post 'register', to: 'users#create'
  get 'user/:username', to: 'users#show', as: :user

  get 'user/:username/address/new', to: 'addresses#new', as: :new_address
  post 'user/:username/address/new', to: 'addresses#create'
  get 'user/:username/address/edit', to: 'addresses#edit', as: :edit_address
  patch 'user/:username/address/edit', to: 'addresses#update'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
