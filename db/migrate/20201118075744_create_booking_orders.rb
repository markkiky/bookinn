class CreateBookingOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_orders do |t|
      t.string :booking_order_id
      t.string :booking_order_date
      t.string :customer_id
      t.string :total_applicants
      t.string :room_type_id
      t.datetime :stay_start_date
      t.datetime :stay_end_date
      t.string :booking_order_status
      t.string :booking_order_type_id

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
