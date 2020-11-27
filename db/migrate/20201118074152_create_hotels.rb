class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :hotel_id
      t.string :hotel_name
      t.string :hotel_email
      t.string :hotel_contact_person
      t.string :hotel_mobile
      t.string :hotel_type_id
      t.string :parent_hotel_id
      t.string :hotel_status
      
      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
