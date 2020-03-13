Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :reservations, only: [:new, :create]
  get "/my_gardes", to: "gardes#view_my_gardes", as: "my_gardes"
  get "/my_garde/:id", to: "gardes#view_my_garde", as: "my_garde"
  get "/my_reservations", to: "reservations#view_my_reservations", as: "my_reservations"
  # get "/my_meals", to: "meals#view_my_meals", as: "my_meals"
  # get "/my_meal/:id", to: "meals#view_my_meal", as: "my_meal"
  # get "/my_orders", to: "orders#view_my_orders", as: "my_orders"

  resources :gardes


    # resources :reviews, only: [ :new, :create ]

end
