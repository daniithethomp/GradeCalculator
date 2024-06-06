Rails.application.routes.draw do

  # Define the routes for the sessions controller
  get "/home", to: "sessions#home"
  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  resources :years, only: [:new, :create, :edit, :update, :show, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  root "sessions#home"
end
