Rails.application.routes.draw do
  resources :tests, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :course_modules
  resources :years
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated(:user) do
      root to: "years#index", as: :authenticated_root
    end
    root to: "devise/registrations#new"
  end
end
