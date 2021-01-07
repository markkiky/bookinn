class CreateLaundryPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :laundry_packages do |t|
      t.string :laundry_description
      t.string :amount

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
