Rails.application.routes.draw do
  get 'messages/new'
  get 'messages/create'
  devise_for :users

  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'


  resources :activities do
    resources :bookings
    resources :interests
  end

end
