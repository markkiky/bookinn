class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :ticket_id
      t.string :ticket_no
      t.string :customer_id
      t.string :ticket_description
      t.string :ticket_date
      t.string :ticket_status
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
