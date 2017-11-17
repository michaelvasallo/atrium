Rails.application.routes.draw do
  get 'games/(:genre)', to: 'games#index', as: 'games'

  get 'game/:slug', to: 'games#show', as: 'game'

  get 'cart', to: 'carts#index'
  put 'cart', to: 'carts#create'
  delete 'cart', to: 'carts#delete'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
