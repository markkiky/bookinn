class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.string :discount_id
      t.string :amount
      t.string :discount_rate

      t.timestamps
    end
  end
end
