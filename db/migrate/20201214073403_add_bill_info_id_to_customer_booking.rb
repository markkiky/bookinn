class AddBillInfoIdToCustomerBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :customer_bookings, :bill_info_id, :string
  end
end
