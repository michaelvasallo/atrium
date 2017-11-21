Rails.application.routes.draw do
  devise_for :users
  resources :games, only: [:index, :show]

  get 'cart', to: 'carts#index'
  put 'cart', to: 'carts#create'
  delete 'cart', to: 'carts#destroy'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
