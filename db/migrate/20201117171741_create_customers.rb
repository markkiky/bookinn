class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :customer_no
      t.string :customer_id
      t.string :customer_type_id
      t.string :country_id
      t.string :customer_names
      t.string :customer_email
      t.string :customer_mobile
      t.string :customer_address
      t.string :customer_postcode
      t.string :customer_status
      t.string :customer_id_no
      t.datetime :customer_status_date
      t.datetime :last_visit
      t.datetime :last_invoice
      t.datetime :last_receipt
      
      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
