class CreateLaundryPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :laundry_packages do |t|
      t.string :laundry_description
      t.string :amount

      t.timestamps
    end
  end
end
