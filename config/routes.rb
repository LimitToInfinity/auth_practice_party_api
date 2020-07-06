Rails.application.routes.draw do
  resources :beverages, only: [:index, :create]
  resources :users, only: [:index, :create]

  post "/login", to: "authentication#login"
end
