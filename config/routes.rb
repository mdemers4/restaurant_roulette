Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "reservations#index"

  resources :users, only: [:new, :create, :show] do 
    resources :restaurants, only: [:index,:new, :create]
    end


  resources :reservations, only: [:index, :new, :create]


  resources :restaurants, only: [:show]

  resources :sessions, only: [:new, :create, :destroy]

end
