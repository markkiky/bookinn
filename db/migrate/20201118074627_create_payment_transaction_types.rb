class CreatePaymentTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_transaction_types do |t|
      t.string :payment_transaction_type_id
      t.string :payment_transaction_type_description
      t.string :payment_transaction_type_status

      t.timestamps
    end
  end
end
