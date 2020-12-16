class CreatePaymentTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_transactions do |t|
      t.string :payment_transaction_id
      t.string :booking_order_id
      t.string :bill_no
      t.datetime :payment_transaction_date
      t.string :payment_transaction_type_id
      t.string :payment_transaction_amount
      t.string :payment_mode_id

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
