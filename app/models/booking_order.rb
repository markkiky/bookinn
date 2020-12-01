class BookingOrder < ApplicationRecord

    def self.booking_customer(booking_order_id)
        @customers = []
        # byebug
        CustomerBooking.where(:booking_order_id => booking_order_id).each do |customer_booking|
            @customers << Customer.find(customer_booking['customer_id'])
        end
        return @customers
    end
end
