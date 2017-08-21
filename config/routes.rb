Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  resources :drones do
    resources :bookings, only: [ :create ]
  end

  devise_for :users
  root to: 'pages#home'
end
