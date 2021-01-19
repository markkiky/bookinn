class CustomerBooking < ApplicationRecord
    belongs_to :customer, class_name: "Customer"
    belongs_to :booking_order, class_name: "BookingOrder"
    # create a function that creates the customer and booking join
    # checks for existing relationships first before duplicating

    # creates a customer bookin
    def self.make(customer_id, booking_order_id)
        @customer_booking = CustomerBooking.find_or_create_by(:customer_id => customer_id, :booking_order_id => booking_order_id)

        if @customer_booking != nil
            return true
        elsif @customer_booking == nil
            return false
        end
    end

    # removes a customer from a bookinn
    def self.remove(customer_id, booking_order_id)
        @customer_booking = CustomerBooking.find_by(:customer_id => customer_id, :booking_order_id => booking_order_id)

        if @customer_booking != nil
            @customer_booking.update(:is_active => "0")
            return true
        elsif @customer_booking == nil
            return false
        end
    end
end
