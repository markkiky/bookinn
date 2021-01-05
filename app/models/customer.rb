class Customer < ApplicationRecord
  require "csv"
  validates :email, uniqueness: true
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # validates :id_no, uniqueness: true

  has_many_attached :id_document

  # tickets relation
  has_many :tickets

  # returns a valid customer no for a new customer
  def self.customer_no
    @customers = Customer.all
    @customer_no = nil
    prefix = "C#"
    if @customers.count > 0
      if @customers.last.customer_no
        # last customer number is valid
        count = @customers.last.customer_no.split(//).last(3).join.to_i
        count = count + 1
        series = count.to_s
        @customer_no = "#{prefix}#{series.rjust(3, "0")}"
        return @customer_no
      else
        # last customer number is invalid
        count = @customers.last.id
        count = count + 1
        series = count.to_s
        @customer_no = "#{prefix}#{series.rjust(3, "0")}"
        return @customer_no
      end
    else
      # No customers. Initialise new count
      count = 1
      series = count.to_s
      @customer_no = "#{prefix}#{series.rjust(3, "0")}"
      return @customer_no
    end
  end

  # returns a valid customer id for new customers
  def self.customer_id
    @customers = Customer.all
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

  # return all the customers bookings
  def self.customer_bookings(customer_id)
    @booking_orders = []
    CustomerBooking.where(:customer_id => customer_id).each do |customer_booking|
      @booking_orders << BookingOrder.find(customer_booking["booking_order_id"])
    end
    return @booking_orders
  end

  def self.import(file)
    @customers = []
    Customer.transaction do
      CSV.foreach(file.path, headers: true) do |row|
        # byebug
        @row = row.to_hash
        @customer = Customer.find_or_create_by(:email => @row["email"])
        @customer.update(:names => @row["names"], :phone => @row["phone"], :id_no => @row["id_no"])
        @customers << @customer
      end
    end
    return @customers
  end
end
