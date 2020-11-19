class CreateHotelAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_amenities do |t|
      t.string :hotel_amenity_id
      t.string :hotel_amenity_name
      t.string :hotel_amenity_description

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
