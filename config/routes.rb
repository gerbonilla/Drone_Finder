Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"


  resources :profiles, only: [:show, :update]
  resources :users, only: [:show, :update]

  resources :drones do
    resources :bookings, only: [ :create ]
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
end
