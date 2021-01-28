class BillInfo < ApplicationRecord
  has_many :bill_details

  # return a unique bill no for bookinn system only
  def self.bill_no
    @bill_infos = BillInfo.all
    prefix = "BK"
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
      series = @bill_infos.last.bill_no.split(//).last(4).join.to_i
      # @bill_infos.last
      series = series + 1
      series = series.to_s
      bill_no = "#{prefix}#{year}#{day}-#{month}#{series.rjust(4, "0")}"

      return bill_no
    end
  end

  def self.bill_details(bill_info_id)
    # @bill_info = BillInfo.find(bill_info_id)

    @bill_details = BillDetail.all.where(bill_info_id: bill_info_id, :is_active => "1")

    return @bill_details
  end

  def self.update_bill_status(bill_info_id)
    @bill_info = BillInfo.find(bill_info_id)
    if @bill_info.reducing_balance.to_i > 0 && @bill_info.reducing_balance == @bill_info.bill_total
      return "15"
      # unpaid
    elsif @bill_info.reducing_balance.to_i > 0 && @bill_info.reducing_balance != @bill_info.bill_total
      return "16"
      # partial
    elsif @bill_info.reducing_balance.to_i == 0 && @bill_info.reducing_balance != @bill_info.bill_total
      return "17"
      # paid
    elsif @bill_info.reducing_balance.to_i < 0 && @bill_info.reducing_balance != @bill_info.bill_total
      return "18"
      # overpaid
    end
  end

  # Returns a fee for room price, nights spent and the total applicants
  def self.calculate_fee(room_price, no_of_nights, applicants)
    if room_price <= 0
      room_price = 1
    elsif no_of_nights <= 0
      no_of_nights = 1
    elsif applicants <= 0
      applicants = 1
    else
    end

    @bill_total = room_price * no_of_nights * applicants
    return @bill_total
  end

  # Returns a fee for room price and the nights spent
  def self.calculate_fee_price_and_nights(room_price, no_of_nights)
    @bill_total = room_price * no_of_nights
    return @bill_total
  end

  # Returns a fee for the sum of all the bill details of a bill
  def self.calculate_fee_sum_details(bill_info_id)
    @bill_info = BillInfo.find(bill_info_id)
    @bill_total = 0

    @bill_details = BillDetail.all.where(:bill_info_id => bill_info_id, :is_active => "1")

    @bill_details.each do |bill_detail|
      @bill_total = @bill_total + bill_detail.amount.to_i
    end
    return @bill_total
  end

  def self.updated_reducing_balance(bill_info_id)
    # @bill_info = BillInfo.find(bill_info_id)
    @reducing_balance = 0
    @bill_total = BillInfo.calculate_fee_sum_details(bill_info_id)
    # byebug
    @total_paid = 0
    @payment_transactions = PaymentTransaction.all.where(:bill_no => @bill_info.bill_no, :is_active => "1")
    @payment_transactions.each do |payment|
      # byebug
      @total_paid = @total_paid + payment.payment_transaction_amount.to_i
    end
    @reducing_balance = @bill_total - @total_paid
    # byebug
    return @reducing_balance
  end

  def self.bill_response(bill_info_id)
    @bill_info = BillInfo.find(bill_info_id)
    @booking_order = BookingOrder.find(@bill_info.booking_order_id)
    @bill_response = {
      booking_order_id: @booking_order.id,
      booking_no: @booking_order.booking_no,
      bill_info_id: @bill_info.id,
      bill_no: @bill_info.bill_no,
      bill_date: @bill_info.bill_date,
      customer: @bill_info.customer_id ? Customer.find(@bill_info.customer_id).names : "Customer not found",
      bill_total: @bill_info.bill_total,
      reducing_balance: @bill_info.reducing_balance,
      bill_status: @bill_info.bill_status ? Status.find(@bill_info.bill_status).status_description : "Status not defined",
    }

    return @bill_response
  end
end
