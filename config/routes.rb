Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "reservations#index"

  resources :users, only: [:new, :create, :show] do 
    resources :restaurants, only: [:index,:new, :create, :show]
    resource :saved_reservations, only: [:create]
    end


  resources :reservations, only: [:index, :new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :confirmation, only: [:index] 

end
