Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "reservations#index"
  resources :users, only: [:new, :create]

  resources :reservations, only: [:index, :new, :create]

  resources :restaurants, only: [:new, :create, :show]

end
