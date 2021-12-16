Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete'
  resources :shippings, only: [:new, :create, :destroy]
  resources :orders, only: [:new, :create,]
  resources :contacts, only: [:new, :create]

  get 'cart_items/destroy_all'
  resources :cart_items, only: [:index, :create, :update, :destroy]

  resources :items, only: [:index, :show]
  root to: 'homes#top'
  namespace :admins do
    root to: 'homes#top'
    resources :items
  end

  resources :customers, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
