class BookingOrder < ApplicationRecord
  has_many :booking_order_details
  
  def self.booking_customer(booking_order_id)
    @customers = []
    # byebug
    CustomerBooking.where(:booking_order_id => booking_order_id, :is_active => "1").each do |customer_booking|
      @customers << Customer.find(customer_booking["customer_id"])
    end
    return @customers
  end

  # return a unique booking order no for each new booking
  def self.booking_order_no
    @bill_infos = BookingOrder.all
    prefix = "BON"
    year = Date.today.year.to_s
    year = year.slice(2..3)

    month = Date.today.month.to_s
    month = month.ljust(2, "0")

    day = Date.today.day.to_s
    day = day.rjust(2, "0")

    # No present bills. Start new billings
    if @bill_infos.count < 1
      series = "9999"
      bill_no = "#{prefix}#{year}#{day}-#{month}#{series.rjust(4, "0")}"
      return bill_no
    else
      # series = @bill_infos.last.booking_no.split(//).last(4).join.to_i
      series = 254
      # @bill_infos.last
      series = series + 1
      series = series.to_s
      bill_no = "#{prefix}#{year}#{day}-#{month}#{series.rjust(4, "0")}"

      return bill_no
    end
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
          :bill_item_rate => "",
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
          bill_amount: @bill_info.bill_total,
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
    @bill_infos = BillInfo.where(:booking_order_id => booking_order_id, :is_active => "1")

    # @customer_bookings = CustomerBooking.where(:booking_order_id => booking_order_id, :is_active => 1)
    @bill_info_ids = []
    # byebug
    @bill_infos.each do |booking|
     
        @bill_info_ids << booking.id
      
    end
    return @bill_info_ids
  end

  def self.bills(booking_order_id)
    @bill_info_ids = BillInfo.all.where(:booking_order_id => booking_order_id, :is_active => "1")
    @bills = []
    # byebug
    if @bill_info_ids.count > 0
      @bill_info_ids.each do |bill_id|
        @bill_info = BillInfo.find_by(id: bill_id)
        @bill_details = BillDetail.where(bill_info_id: bill_id, is_active: "1")

        @bill_detail_response = []
        @bill_details.each do |bill_detail|
          @bill_detail_response << {
            bill_detail_id: bill_detail.id,
            bill_no: bill_detail.bill_no,
            room_type: RoomType.find_by(id: bill_detail.room_type_id) ? RoomType.find_by(id: bill_detail.room_type_id).room_type_description : "Room Type is undefined",
            room_type_id: bill_detail.room_type_id,
            amount: bill_detail.amount
          }
        end
        @bill_info_response = {
          bill_info_id: @bill_info.id,
          bill_no: @bill_info.bill_no,
          bill_date: @bill_info.bill_date,
          customer: Customer.find_by(id: @bill_info.customer_id)? Customer.find_by(id: @bill_info.customer_id).names : "Customer is not defined",
          customer_id: @bill_info.customer_id,
          bill_total: @bill_info.bill_total,
          reducing_balance: @bill_info.reducing_balance,
          bill_status: Status.find_by(id: @bill_info.bill_status)? Status.find_by(id: @bill_info.bill_status).status_description : "Status is not defined",
          bill_details: @bill_detail_response
        }
        @bills << @bill_info_response
      end
      return @bills
    else
      return @bills
    end
  end

  # determines a bookings start date
  def self.stay_start_date(booking_order_id)
    @booking_order = BookingOrder.find_by(id: booking_order_id)

    @booking_order_details = BookingOrderDetail.all.where(:booking_order_id => @booking_order) if !@booking_order.nil?

    @stay_start_dates = []
    @booking_order_details.each do |booking_order_detail|
     @stay_start_dates << booking_order_detail.stay_start_date
    end
    return @stay_start_dates.min
  end

  # determines a bookings end date
  def self.stay_end_date(booking_order_id)
    @booking_order = BookingOrder.find_by(id: booking_order_id)

    @booking_order_details = BookingOrderDetail.all.where(:booking_order_id => @booking_order) if !@booking_order.nil?

    @stay_end_dates = []
    @booking_order_details.each do |booking_order_detail|
     @stay_end_dates << booking_order_detail.stay_end_date
    end
    return @stay_end_dates.max
  end
end
