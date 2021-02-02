require 'sinatra'
require 'Customer'

1000.times do  
    user = Customer.new
    user.names ="#{Faker::Name.first_name}  #{Faker::Name.last_name}"
    # user.last_name = Faker::Name.last_name
    user.email = Faker::Internet.email
    user.phone = Faker::PhoneNumber.cell_phone
    user.customer_type_id = "2"
    user.save!
end