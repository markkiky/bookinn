class CreateHotelWings < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_wings do |t|
      t.string :hotel_wing_id
      t.string :wing_description
      t.string :hotel_wing_status
      
      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
