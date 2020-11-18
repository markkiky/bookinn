class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :user_name
      t.string :id_document_no
      t.string :id_document_type
      t.string :identification_no
      t.string :user_department
      t.string :user_type_id
      t.string :user_status
      t.string :email
      t.string :password_digest
      t.string :role_id
     

      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
