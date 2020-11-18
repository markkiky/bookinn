class CreateRoomAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :room_assignments do |t|
      t.string :room_assignment_no
      t.string :customer_id
      t.string :customer_names
      t.string :room_no
      t.string :start_date
      t.string :end_date
      t.string :room_status

      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
