class CreateBookingOrderTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_order_types do |t|
      t.string :booking_order_type_id
      t.string :booking_order_type_description
      t.string :booking_order_type_status

      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
