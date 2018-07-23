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
   resources :users, only:[:show, :index, :edit, :update, :destroy]
   get 'users/search', to: 'users#search', as: 'search_user'
  end

  namespace :admins do
    get 'products/new' => 'products#new', as: 'new_product'
    post 'products/new' => 'products#new', as: 'create_product'
    resources :products, only: [:index, :show, :update, :destroy, :edit]
  end

  namespace :admins do
    get 'orders/index'
    get 'orders/:id/show' => 'orders#show', as: 'order_show'
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

  get 'orders/select_address' => 'orders#select_address'
  post 'orders/create_address' => 'orders#create_address'
  get 'orders/confirm' => 'orders#confirm'
  post 'orders/create' => 'orders#create', as:'create_order'
  get 'orders/show' => 'orders#show', as: 'show_order'

  #get 'carts/add_cart_item' => 'carts#add_cart_item'
  post '/products/:id/add_cart_items' => 'products#add_cart_item', as: 'add_cart_items'

  patch '/products/:id/cart_items/:id/update_cart_items' => 'products#update_cart_item', as: 'update_cart_items'

  get 'carts/show' => 'carts#show'
  delete 'carts/delete_item' => 'carts#delete_item'
  delete 'carts/delete_all_items' => 'carts#delete_all_items'
  get 'carts/checkout' => 'carts#checkout'
  #get 'products/index'
  #get 'products/show'
  resources :products, only: [:index, :show] do
    resource :favorites, only:[:create, :destroy]
  end

  get 'admins/top' => 'admins/users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resourses :contacts
end
