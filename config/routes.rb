Rails.application.routes.draw do
  get 'bookings/index'

  get 'bookings/show'

  get 'bookings/new'

  get 'bookings/create'

  get 'drones/index'

  get 'drones/show'

  get 'drones/new'

  get 'drones/create'

  get 'drones/edit'

  get 'drones/update'

  get 'drones/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
