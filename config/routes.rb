Rails.application.routes.draw do
  get 'messages/new'
  get 'messages/create'
  devise_for :users

  root to: 'pages#home'


  resources :activities do
    resources :bookings
    resources :interests
  end

end
