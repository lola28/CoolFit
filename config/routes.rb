Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
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
