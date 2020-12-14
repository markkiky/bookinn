class BookingOrder < ApplicationRecord
  def self.booking_customer(booking_order_id)
    @customers = []
    # byebug
    CustomerBooking.where(:booking_order_id => booking_order_id).each do |customer_booking|
      @customers << Customer.find(customer_booking["customer_id"])
    end
    return @customers
  end

  # returns a unique booking_order_id for new booking
  def self.booking_order_id
    @customers = BookingOrder.all
    if @customers.count > 0
      # customers present. continue count
      count = @customers.last.id
      count = count + 1
      series = count.to_s
      @customer_id = "#{series.rjust(3, "0")}"
      return @customer_id
    else
      # no customer present. initiate count
      count = "1"
      @customer_id = "#{count.rjust(3, "0")}"
      return @customer_id
    end
  end

  def self.bill_booking(booking_order_id)
    # create a bill info for the booking
    # attach bill details for each particular room booked
    # go through a booking and get the customers and room assigned
    @customer_bookings = CustomerBooking.where(:booking_order_id => booking_order_id)

    @customer_bookings.each do |booking|
      # create bill and bill details
      # byebug
      bills = BookingOrder.booking_bills(booking.id)
      if bills.count < 1
        @bill_item = BillItem.new(
          :bill_item_id => BillItem.bill_item_id,
          :bill_item_description => "Room Assignment",
          :bill_item_rate => ""
        )
        @bill_item.save

        @bill_detail = BillDetail.new(
          :bill_no => BillInfo.bill_no,
          :bill_item_id => @bill_item.id,
        )
        @bill_info = BillInfo.new(
          :bill_no => BillInfo.bill_no,
          :bill_date => Time.now,
          :customer_id => "1",
          :bill_total => Room.find_by(id: booking.room_id).room_price,
        )
        
        @bill_info.save
        booking.update(:bill_info_id => @bill_info.id)
        @bill_detail.save

        response = {
            bill_no: @bill_info.bill_no,
            bill_amount: @bill_info.bill_total
        }
        return response
      else
        # bill already exists
        # check if we need to add bill details and update bill total
      end
      #   byebug
    end
  end

  #  checks if a particular booking has been billed before and returns bill no if true
  def self.booking_bills(booking_order_id)
    @customer_bookings = CustomerBooking.where(:booking_order_id => booking_order_id)
    @bill_infos = []
    @customer_bookings.each do |booking|
      if booking.bill_info_id != nil
        @bill_infos << booking.bill_info_id
      end
    end
    return @bill_infos
  end
end
