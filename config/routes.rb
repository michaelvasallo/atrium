Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'games#index'

  get 'games/(:genre)', to: 'games#index', as: 'games'
  get 'game/:id', to: 'games#show', as: 'game'

  get 'cart', to: 'carts#index'
  put 'cart', to: 'carts#create'
  delete 'cart', to: 'carts#destroy'

  get 'register', to: 'users#new'
  post 'users', to: 'users#create'
  get 'user/:username', to: 'users#show', as: :user

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
