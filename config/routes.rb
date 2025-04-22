Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :heroes
  end


  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
