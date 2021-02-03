Rails.application.routes.draw do
  require "sidekiq/web"
  require "sidekiq-status/web"
  require "sidekiq/cron/web"
  mount Sidekiq::Web, at: "/sidekiq"
  resources :laundries
  resources :laundry_packages
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
  resources :gender
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Front Office 
  # get "room/available", to: 'rooms#available', as: :available_rooms
  post "room/status", to: 'front_office#room_availability'
  # post "arrivals", to: "front_office#expected_arrivals", as: :expected_arrivals
  post "arrivals", to: "booking_orders#expected_arrivals", as: :expected_arrivals
  # post "departures", to: "front_office#expected_departures", as: :expected_departures
  post "departures", to: "booking_orders#expected_departures", as: :expected_departures
  post "arrivals_departures", to: "front_office#arrivals_departures"
  post "needs_preferences", to: 'front_office#needs_preferences'
  get "needs_preferences", to: 'front_office#show_needs_preferences'
  post 'bookinn/walkin', to: "front_office#walkin_bookinn"
  # post 'bookinn/walkin', to: "booking_orders#walkin_bookinn"
  post "check_in", to: "front_office#check_in"
  get "check_in", to: "front_office#get_check_in"
  post 'check_out', to: "front_office#check_out"
  get "check_out", to: "front_office#get_check_out"

  # post "bookinn/mass_booking", to: "front_office#mass_booking"
  post "bookinn/mass_booking", to: "booking_orders#mass_booking"

  post "bookinn/add_customer", to: "front_office#add_customer_to_booking"
  post "bookinn/remove_customer", to: "front_office#remove_customer_from_booking"

  post "transfer/:id", to: "front_office#room_assignment_transfer"
  # post "transfer", to: "front_office#room_transfer"
  post "transfer", to: "booking_orders#booking_transfer"

  # status
  get 'status/:id', to: "status_clusters#status"

  # Dashboard
  get 'dashboard', to: "reports#dashboard"


  # Generate Token
  post 'auth/login', to: 'authentication#login'
  # reset password routes
  post 'password/forgot', to: 'authentication#forgot'
  post 'password/reset', to: 'authentication#reset'

  # Upload Customers CSV
  post 'upload/customer/csv', to: "front_office#upload_customers_csv"
  get 'channel_customers', to: "customers#channel_customers"

  # Payment Callbacks
  post "receive_mpesa_transactions", to: "callback#receive_mpesa_transactions"
  post "mpesa_response", to: "callback#mpesa_frontend_transaction"
  post "receive_card_transactions", to: "callback#receive_card_transactions"


  # hotels
  get "hotel_rooms/:id", to: "hotels#hotel_rooms"
  get "hotel_sisters/:id", to: "hotels#sister_hotels"

  # bills 
  post "search_bill", to: "bill_infos#search_bill"

  # Reports
  get "report/mass", to: "reports#mass_booking"
  get "report/walkin", to: "reports#walkin_booking"
  
  get "report/booking", to: "reports#all_bookings"
  get "report/booking/:status", to: "reports#bookings_by_status"
end
