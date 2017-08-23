Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"


  resources :profiles, only: [:show, :update]


  resources :drones do
    resources :bookings, only: [ :create, :update ]
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
end
