class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :currency_id
      t.string :currency_symbol
      t.string :currency_name
      t.string :country_id

      t.timestamps
    end
  end
end
