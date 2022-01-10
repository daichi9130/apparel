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
  get 'orders/confirm' => 'orders#confirm_get'
  get 'orders/complete'
  get 'contacts/complete'

  resources :shippings, only: [:new, :create, :destroy]
  resources :orders, only: [:new, :create,]
  resources :contacts, only: [:new, :create]

  resources :cart_items, only: [:index, :create, :update, :destroy] do
   collection do
      delete 'destroy_all'
    end
  end

  resources :items, only: [:index, :show]
  root to: 'homes#top'

  namespace :admins do
    root to: 'homes#top'
    resources :items
    resources :shops, only: [:new, :create]
  end

  resources :customers, only: [:show,] do
   collection do
      get 'item'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
