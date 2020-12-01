class CreateNeedTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :need_types do |t|
      t.string :need_type_id
      t.string :need_description
      t.string :need_type_status

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
