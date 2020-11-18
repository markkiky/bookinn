class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :role_id
      t.string :role_description
      t.string :role_status

      t.timestamps
    end
  end
end
