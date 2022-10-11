Rails.application.routes.draw do
  resources :users
  resources :posts
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"
end
