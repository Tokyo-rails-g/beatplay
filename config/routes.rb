Rails.application.routes.draw do
  namespace :admins do
    get 'contacts/index'
    get 'contacts/show'
    get 'contacts/new'
    get 'contacts/create'
  end
  namespace :admins do
    get 'users/show'
    get 'users/index'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
  end
  namespace :admins do
    get 'products/index'
    get 'products/show'
    get 'products/update'
    get 'products/destroy'
    get 'products/edit'
    get 'products/new'
    post 'products' => 'products#create'
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  get 'favorites/create'
  get 'favorites/destroy'
  get '/contacts/new' => 'contacts#new'
  post '/contacts/create' => 'contacts#create'
  get 'orders/select_address'
  get 'orders/create_address'
  get 'orders/confirm'
  get 'orders/create'
  get 'orders/show'
  get 'carts/add_cart_item'
  get 'carts/show'
  get 'carts/delete_item'
  get 'carts/delete_all_items'
  get 'carts/checkout'
  get 'products/index'
  get 'products/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resourses :contacts
end
