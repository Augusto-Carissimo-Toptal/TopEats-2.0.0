Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources :customers
  resources :couriers
  resources :orders
  resources :address
  resources :vehicles

end
