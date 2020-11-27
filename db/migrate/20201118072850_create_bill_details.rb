class CreateBillDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_details do |t|
      t.string :bill_no
      t.string :bill_item_id
      t.string :bill_item_quantity
      t.string :bill_item_rate
      t.string :bill_item_amount
      t.string :bill_item_discount

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
