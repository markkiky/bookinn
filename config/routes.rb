Rails.application.routes.draw do
  resources :logs
  resources :status_clusters
  resources :statuses
  resources :currency_exchange_rates
  resources :currencies
  resources :roles
  resources :id_documents
  resources :unit_of_measures
  resources :booking_order_types
  resources :booking_orders
  resources :payment_modes
  resources :payment_transaction_types
  resources :payment_transactions
  resources :hotels
  resources :countries
  resources :channel_transactions
  resources :channels
  resources :bill_infos
  resources :bill_details
  resources :bill_items
  resources :need_types
  resources :customer_needs
  resources :hotel_wings
  resources :room_assignments
  resources :customer_types
  resources :customers
  resources :room_amenities
  resources :hotel_amenities
  resources :room_types
  resources :rooms
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Front Office 
  # get "room/available", to: 'rooms#available', as: :available_rooms
  post "room/status", to: 'front_office#room_availability'
  post "arrivals", to: "front_office#expected_arrivals"
  post "departures", to: "front_office#expected_departures"

  # Generate Token
  post 'auth/login', to: 'authentication#login'
  # reset password routes
  post 'password/forgot', to: 'authentication#forgot'
  post 'password/reset', to: 'authentication#reset'
end
