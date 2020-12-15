class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :customer_no
      t.string :customer_id
      t.string :customer_type_id
      t.string :country_id
      t.string :names
      t.string :gender
      t.string :email
      t.string :phone
      t.string :address
      t.string :postal_code
      t.string :customer_status
      t.string :id_no
      t.datetime :customer_status_date
      t.datetime :last_visit
      t.datetime :last_invoice
      t.datetime :last_receipt

      t.string :is_channel, :default => "0"
      t.string :channel_id
      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
