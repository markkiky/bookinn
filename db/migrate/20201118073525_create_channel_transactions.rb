class CreateChannelTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :channel_transactions do |t|
      t.string :channel_transaction_id
      t.datetime :channel_transaction_date
      t.string :channel_transaction_type
      t.string :channel_transaction_amount

      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
