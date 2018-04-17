Rails.application.routes.draw do
  resources :locations
  resources :events
  resources :users
  match '/add-guest', to: 'events#add_guest',via: [:get, :post]

end
