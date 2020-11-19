class CreatePaymentModes < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_modes do |t|
      t.string :payment_mode_id
      t.string :payment_mode_description
      t.string :payment_mode_status

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
