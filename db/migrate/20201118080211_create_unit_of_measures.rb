class CreateUnitOfMeasures < ActiveRecord::Migration[6.0]
  def change
    create_table :unit_of_measures do |t|
      t.string :unit_id
      t.string :unit_description
      t.string :unit_status
      
      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
