Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'bookings/update'

  resources :activities do
    resources :bookings
    resources :interests
  end

end
