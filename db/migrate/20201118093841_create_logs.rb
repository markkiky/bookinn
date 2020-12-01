class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :company_code
      t.string :token
      t.string :username
      t.string :description

      t.timestamps
    end
  end
end
