class CreateCustomerTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_types do |t|
      t.string :customer_type_id
      t.string :customer_type_description
      t.string :customer_type_status

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
