class CreateBillInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_infos do |t|
      t.string :bill_no
      t.datetime :bill_date
      t.string :customer_id
      t.string :bill_total

      t.timestamps
    end
  end
end
