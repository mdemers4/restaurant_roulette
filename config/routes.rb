Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#new"


  resources :users, only: [:new, :create, :show] do 
    resources :restaurants

    resource :saved_reservations, only: [:create, :destroy]
  end

  resources :reservations, only: [:index, :new, :create, :show, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

end