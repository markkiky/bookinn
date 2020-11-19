class CreatePaymentTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_transaction_types do |t|
      t.string :payment_transaction_type_id
      t.string :payment_transaction_type_description
      t.string :payment_transaction_type_status

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
