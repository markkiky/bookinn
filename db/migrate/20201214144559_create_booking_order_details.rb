class CreateBookingOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_order_details do |t|
      t.string :booking_order_id
      t.string :room_type_id
      t.datetime :stay_start_date
      t.datetime :stay_end_date
      t.string :total_applicants
      t.string :amount

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
