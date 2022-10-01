Rails.application.routes.draw do
  resources :users
  resources :posts
  post "/auth/login", to: "authentication#login"
end
