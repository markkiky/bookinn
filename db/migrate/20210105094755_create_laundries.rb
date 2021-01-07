class CreateLaundries < ActiveRecord::Migration[6.0]
  def change
    create_table :laundries do |t|
      t.string :laundry_package_id
      t.string :customer_id
      t.string :booking_order_id
      t.string :laundry_status
      
      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
