class CreateRoomTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :room_types do |t|
      t.string :room_type_id
      t.string :bill_item_id
      t.string :room_type_description
      t.string :room_type_status
      t.string :room_type_total
      t.string :room_price

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
