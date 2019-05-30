Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'
  get 'dashboard/owner', to: 'pages#dashboard_owner'

  get 'profile', to: 'pages#show_profile'
  post 'profile', to: 'pages#edit_profile'

  get 'messages/new'
  get 'messages/create'

  resources :activities do
    # resources :bookings
    # resources :interests
    resources :bookings, only: [:create, :edit, :update, :destroy]
    resources :interests, only: [:create, :destroy]
  end

end
