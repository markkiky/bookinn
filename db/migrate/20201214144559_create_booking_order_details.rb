class CreateBookingOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_order_details do |t|
      t.string :booking_order_id
      t.string :room_type_id
      t.string :stay_start_date
      t.string :stay_end_date
      t.string :total_applicants
      t.string :amount

      t.timestamps
    end
  end
end
