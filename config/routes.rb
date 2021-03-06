Rails.application.routes.draw do

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

  namespace :admins do
    get 'contacts/index'
    get 'contacts/:id/show' => 'contacts#show', as: 'contact_show'
    get 'contacts/new'
    post 'contacts' => 'contacts#create'

   # get 'users/show'
   #get 'users/index' => 'admins/users#index'
   # get 'users/edit'
   # get 'users/update'
   # delete 'users/destroy'
   post 'users/:id/edit' => 'admins/users#edit', as: 'edit_user'
   resources :users, only:[:show, :index, :edit, :update, :destroy]
   get 'users/search', to: 'users#search', as: 'search_user'
  end

  namespace :admins do
    get 'products/new' => 'products#new', as: 'new_product'
    post 'products/new' => 'products#new', as: 'create_product'
    resources :products, only: [:index, :show, :destroy, :edit]
  end

  namespace :admins do
    get 'orders/index'
    get 'orders/:id/show' => 'orders#show', as: 'order_show'
    patch 'orders/:id/update' => 'orders#update', as: 'order_update'
    patch 'orders/:id/update2' => 'orders#update2', as: 'order_update2'
  end



  resources :users, only: [:edit, :update, :destroy]
  get 'users/top' => 'users#top'
  get 'users/:id/password_confirmation' => 'users#confirm', as: 'confirm_user'
  get 'users/:id/mypage' => 'users#mypage', as: 'mypage_user'
  get 'users/:id/edit_name' => 'users#edit_name', as: 'edit_name_user'
  get 'users/:id/edit_address' => 'users#edit_address', as: 'edit_address_user'
  get 'users/:id/edit_phonenumber' => 'users#edit_phonenumber', as: 'edit_phonenumber_user'
  get 'users/:id/edit_email' => 'users#edit_email', as: 'edit_email_user'
  get 'users/:id/edit_password' => 'users#edit_password', as: 'edit_password_user'



  #get 'favorites/create'
  #get 'favorites/destroy'
  resources :contacts, only: [:new, :create]
  # get '/contacts/new' => 'contacts#new'
  # post '/contacts/create' => 'contacts#create'


  resources :orders, only: [:new, :show, :create] do
    collection do
      post 'confirm'
      post 'confirm_user'
    end
  end
  # get 'orders/new' => 'orders#new'
  # post 'orders/create_address' => 'orders#create_address'
  # post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
  # post 'orders/create' => 'orders#create', as:'create_order'
  # get 'orders/show' => 'orders#show', as: 'show_order'

  #get 'carts/add_cart_item' => 'carts#add_cart_item'
  post '/products/:id/add_cart_items' => 'products#add_cart_item', as: 'add_cart_items'
  get '/products/bpms' => 'products#bpms', as: 'bpms-products'

  resources :carts, only: [:index, :destroy] do
    resource :cart_items, only: [:update]
    resources :cart_items, only: [:destroy]
  end
  # get 'carts/:id' => 'carts#show', as: 'carts_show'
  # delete 'carts/delete_item' => 'carts#delete_item', as: 'delete_cart_item'
  # delete 'carts/delete_all_items' => 'carts#delete_all_items', as: 'delete_all_cart_items'

  #get 'products/index'
  #get 'products/show'
  patch 'products/:id/update' => 'products#update', as: 'update_product'
  resources :products, only: [:index, :show] do
    resource :favorites, only:[:create, :destroy]
  end

  get 'admins/top' => 'admins/users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resourses :contacts
end
