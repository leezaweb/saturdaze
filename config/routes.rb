Rails.application.routes.draw do
  resources :amenities
  resources :locations
  resources :events
  resources :users
  match '/add-guest', to: 'events#add_guest',via: [:get, :post]

end
