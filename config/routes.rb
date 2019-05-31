Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'
  get 'dashboard/owner', to: 'pages#dashboard_owner'

  get 'profile', to: 'pages#show_profile'
  get 'profile/edit', to: 'pages#edit_profile'
  patch 'profile', to: 'pages#update_profile', as: 'profile_update'
  get 'activities/search'


  resources :activities do
    # resources :bookings
    # resources :interests
    get 'search', to: 'activities#search', as: 'search'

    resources :messages, only: :create
    post 'booking', to: 'bookings#create'
    patch 'booking', to: 'bookings#update'
    delete 'booking', to: 'bookings#destroy'
    post 'interest', to: 'interests#create'
    delete 'interest', to: 'interests#destroy'

    resources :bookings, only: [:create, :edit, :update, :destroy]
    resources :interests, only: [:create, :destroy]

  end

end
