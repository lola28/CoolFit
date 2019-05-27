Rails.application.routes.draw do
  get 'bookings/update'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :activities do
    resources :bookings
    resources :interests
  end
end
