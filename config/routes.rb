Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/new'

  get 'users/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "reservations#index"
  resources :users, only: [:new, :create]

  resources :reservations, only: [:index, :new, :create]

  resources :restaurants, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

end
