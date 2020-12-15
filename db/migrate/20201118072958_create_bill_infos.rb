class CreateBillInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_infos do |t|
      t.string :bill_no
      t.datetime :bill_date
      t.string :customer_id
      t.string :booking_order_id
      t.string :bill_info_description
      t.string :bill_total
      t.string :reducing_balance
      t.string :bill_status, :default => "15"

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
