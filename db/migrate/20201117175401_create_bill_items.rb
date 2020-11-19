class CreateBillItems < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_items do |t|
      t.string :bill_item_id
      t.string :bill_item_description
      t.string :bill_item_rate
      t.string :bill_item_unit_of_measure_id
      t.string :bill_item_unit_of_measure_description
      t.string :bill_item_status

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
