Rails.application.routes.draw do

  get 'users/edit'
  get 'users/update'
  devise_for :users

  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'dashboard/owner', to: 'pages#dashboard_owner'
  get 'messages/new'
  get 'messages/create'

  resources :activities do
    # resources :bookings
    # resources :interests
    post 'booking', to: 'bookings#create'
    delete 'booking', to: 'bookings#destroy'
    post 'interest', to: 'interests#create'
    delete 'interest', to: 'interests#destroy'
  end

end
