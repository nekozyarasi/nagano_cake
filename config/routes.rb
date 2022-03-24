Rails.application.routes.draw do

  root to: 'customer/items#top'
  get '/about' => 'customer/items#about'

  namespace :admin do
    # get 'order_details/update'
    resources :order_details, only: [:update]
    # get 'orders/index'
    # get 'orders/show'
    # get 'orders/update'
    resources :orders, only: [:index, :show, :update]
    # get 'genres/index'
    # get 'genres/create'
    # get 'genres/edit'
    # get 'genres/update'
    resources :genres, only: [:index, :create, :update, :edit]
    # get 'items/index'
    # get 'items/new'
    # get 'items/create'
    # get 'items/show'
    # get 'items/edit'
    # get 'items/update'
    resources :items, only: [:index, :create, :update, :edit, :new, :show]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/update'
    resources :customers, only: [:index, :update, :edit, :show]
  end

  namespace :customer do

    # get 'items/top'
    # get 'items/about'
    # get 'items/index'
    # get 'items/show'
    resources :items, only: [:index, :top, :about, :show]
    # get 'cart_items/index'
    # get 'cart_items/update'
    # get 'cart_items/create'
    # get 'cart_items/destroy'
    # get 'cart_items/all_destroy'
    resources :cart_items, only: [:index, :create, :update, :destroy, :all_destroy]
    # get 'orders/new'
    # get 'orders/log'
    # get 'orders/create'
    # get 'orders/thanks'
    # get 'orders/index'
    # get 'orders/show'
    resources :orders, only: [:index, :create, :log, :new, :show, :thanks]
    # get 'ships/index'
    # get 'ships/create'
    # get 'ships/destroy'
    # get 'ships/edit'
    # get 'ships/update'
    resources :ships, only: [:index, :create, :update, :edit, :destroy]
    # get 'customers/show'
    # get 'customers/quit'
    # get 'customers/out'
    # get 'customers/edit'
    # get 'customers/update'
    get "customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
    patch "customers/withdraw" => "customers#withdraw", as: "withdraw"
    resources :customers, only: [:quit, :out, :update, :edit, :show]
  end

  devise_for :owners
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
