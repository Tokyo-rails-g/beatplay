Rails.application.routes.draw do

  namespace :admins do
    get 'contacts/index'
    get 'contacts/:id/show' => 'contacts#show', as: 'contact_show'
    get 'contacts/new'
    post 'contacts' => 'contacts#create'
  end
  namespace :admins do
   # get 'users/show'
   #get 'users/index' => 'admins/users#index'
   # get 'users/edit'
   # get 'users/update'
   # delete 'users/destroy'
   resources :users, only:[:show, :index, :edit, :update, :destroy]
  end
  namespace :admins do
    get 'products/index'
    get 'products/:id/show' => 'products#show'
    get 'products/:id/update' => 'products#update'
    get 'products/:id/destroy' => 'products#destroy'
    get 'products/:id/edit' => 'products#edit'
    get 'products/new'
    post 'products' => 'products#create'
    get 'products/:id/add_music' => 'products#new_music', as: 'add_music'
    post 'products/:id/add_music' => 'products#add_music', as: 'create_music'
  end

  namespace :admins do
    get 'orders/index'
    get 'orders/:id/show' => 'orders#show', as: 'order_show'
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

  resources :users, only: [:edit, :update, :destroy]
  get 'users/top' => 'users#top'
  get 'users/:id/password_confirmation' => 'users#confirm', as: 'confirm_user'
  get 'users/:id/mypage' => 'users#mypage', as: 'mypage_user'
  get 'users/:id/edit_name' => 'users#edit_name', as: 'edit_name_user'
  get 'users/:id/edit_address' => 'users#edit_address', as: 'edit_address_user'
  get 'users/:id/edit_phonenumber' => 'users#edit_phonenumber', as: 'edit_phonenumber_user'
  get 'users/:id/edit_email' => 'users#edit_email', as: 'edit_email_user'
  get 'users/:id/edit_password' => 'users#edit_password', as: 'edit_password_user'


# admins/top以外にそれぞれusers/:id/が手前に入ってくる
  get 'favorites/create'
  get 'favorites/destroy'
  get '/contacts/new' => 'contacts#new'
  post '/contacts/create' => 'contacts#create'
  get 'orders/select_address' => 'orders#select_address'
  post 'orders/create_address' => 'orders#create_address'
  get 'orders/confirm' => 'orders#confirm'
  post 'orders/create' => 'orders#create'
  get 'orders/show' => 'orders#show'

  #get 'carts/add_cart_item' => 'carts#add_cart_item'
  post '/products/:id/add_cart_items' => 'products#add_cart_item', as: 'add_cart_items'

  get 'carts/show' => 'carts#show'
  delete 'carts/delete_item' => 'carts#delete_item'
  delete 'carts/delete_all_items' => 'carts#delete_all_items'
  get 'carts/checkout' => 'carts#checkout'
  #get 'products/index'
  #get 'products/show'
  resources :products, only: [:index, :show]

  get 'admins/top' => 'admins/users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resourses :contacts
end
