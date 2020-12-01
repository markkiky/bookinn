class CreateCustomerRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_rooms do |t|
      t.string :customer_id
      t.string :room_id
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
