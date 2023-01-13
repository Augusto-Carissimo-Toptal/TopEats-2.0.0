Rails.application.routes.draw do
  resources :customers
  resources :couriers
  resources :orders
  resources :address
  resources :vehicles

end
