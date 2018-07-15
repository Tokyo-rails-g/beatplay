Rails.application.routes.draw do

  namespace :admins do
    get 'contacts/index'
    get 'contacts/show'
    get 'contacts/new'
    post 'contacts' => 'contacts#create'
  end
  namespace :admins do
    get 'users/show'
    get 'users/index'
    get 'users/edit' => 'users#edit', as: 'admins_edit'
    get 'users/update'
    delete 'users/destroy'
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

  namespace :admins do
    get 'orders/index'
    get 'orders/show'
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

  get 'users/:id/password_confirmation' => 'users#confirm', as: 'confirm_user'
  get 'users/:id/mypage' => 'users#mypage', as: 'mypage_user'
  get 'users/:id/edit_name' => 'users#edit_name', as: 'edit_name_user'
  get 'users/:id/edit_address' => 'users#edit_address', as: 'edit_address_user'
  get 'users/:id/edit_phonenumber' => 'users#edit_phonenumber', as: 'edit_phonenumber_user'
  get 'users/:id/edit_email' => 'users#edit_email', as: 'edit_email_user'
  get 'users/:id/edit_password' => 'users#edit_password', as: 'edit_password_user'

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
  get 'admins/top' => 'admins/users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resourses :contacts
end
