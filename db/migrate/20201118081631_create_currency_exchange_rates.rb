class CreateCurrencyExchangeRates < ActiveRecord::Migration[6.0]
  def change
    create_table :currency_exchange_rates do |t|
      t.string :currency_exchange_rate_id
      t.string :base_currency_id
      t.string :secondary_currency_id
      t.string :exchange_rate
      t.string :start_date
      t.string :end_date
      t.string :exchange_rate_status

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
