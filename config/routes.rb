Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'
  get 'dashboard/owner', to: 'pages#dashboard_owner'

  get 'profile', to: 'pages#show_profile'
  post 'profile', to: 'pages#edit_profile'


  resources :activities do
    # resources :bookings
    # resources :interests
    resources :messages, only: :create
    post 'booking', to: 'bookings#create'
    patch 'booking', to: 'bookings#update'
    delete 'booking', to: 'bookings#destroy'
    post 'interest', to: 'interests#create'
    delete 'interest', to: 'interests#destroy'
  end

end
