class CreateIdDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :id_documents do |t|
      t.string :id_document_no
      t.string :id_document_type
      t.string :id_document_status

      t.timestamps
    end
  end
end
