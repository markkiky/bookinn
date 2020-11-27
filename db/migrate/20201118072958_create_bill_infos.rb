class CreateBillInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_infos do |t|
      t.string :bill_no
      t.datetime :bill_date
      t.string :customer_id
      t.string :bill_total

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
