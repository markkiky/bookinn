Rails.application.routes.draw do
  resources :discounts
  resources :booking_order_details
  resources :customer_rooms
  resources :customer_bookings
  resources :tickets
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
  post "arrivals", to: "front_office#expected_arrivals", as: :expected_arrivals
  post "departures", to: "front_office#expected_departures", as: :expected_departures
  post "arrivals_departures", to: "front_office#arrivals_departures"
  post "needs_preferences", to: 'front_office#needs_preferences'
  get "needs_preferences", to: 'front_office#show_needs_preferences'
  post 'bookinn/walkin', to: "front_office#walkin_bookinn"
  post "check_in", to: "front_office#check_in"
  post 'check_out', to: "front_office#check_out"

  post "mass_booking", to: "front_office#mass_booking"

  post "bookinn/:id/add_customer", to: "front_office#add_customer_to_booking"

  # status
  get 'status/:id', to: "status_clusters#status"

  # Dashboard
  get 'dashboard', to: "front_office#dashboard"


  # Generate Token
  post 'auth/login', to: 'authentication#login'
  # reset password routes
  post 'password/forgot', to: 'authentication#forgot'
  post 'password/reset', to: 'authentication#reset'

  # Upload Customers CSV
  post 'upload/customer/csv', to: "front_office#upload_customers_csv"
end
