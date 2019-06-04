Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'
  get 'dashboard/:id', to: 'pages#dashboard_owner', as: 'owner_dashboard'
  get 'thankyou', to: 'pages#thankyou', as: 'thankyou'
  get 'moreinfo/cardiovascular', to: 'pages#cardiovascular', as: 'cardiovascular'

  post 'recomendation', to: 'recomendations#create'

  get 'profile', to: 'pages#show_profile'
  get 'profile/edit', to: 'pages#edit_profile'
  patch 'profile', to: 'pages#update_profile', as: 'profile_update'
  get 'activities/search'


  resources :activities do
    # resources :bookings
    # resources :interests
    get 'search', to: 'activities#search', as: 'search'

    resources :messages, only: :create
    post 'interest', to: 'interests#create'
    delete 'interest', to: 'interests#destroy'

    resources :bookings, only: [:create, :edit, :update, :destroy]
    resources :interests, only: [:create, :destroy]

  end

end
