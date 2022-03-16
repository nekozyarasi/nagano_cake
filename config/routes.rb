Rails.application.routes.draw do
  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :customer do
    get 'items/top'
    get 'items/about'
    get 'items/index'
    get 'items/show'
  end
  namespace :customer do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/create'
    get 'cart_items/destroy'
    get 'cart_items/all_destroy'
  end
  namespace :customer do
    get 'orders/new'
    get 'orders/log'
    get 'orders/create'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :customer do
    get 'ships/index'
    get 'ships/create'
    get 'ships/destroy'
    get 'ships/edit'
    get 'ships/update'
  end
  namespace :customer do
    get 'customers/show'
    get 'customers/quit'
    get 'customers/out'
    get 'customers/edit'
    get 'customers/update'
  end
  devise_for :owners
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
