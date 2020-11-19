class CreateStatusClusters < ActiveRecord::Migration[6.0]
  def change
    create_table :status_clusters do |t|
      t.string :status_cluster_id
      t.string :cluster_description

      t.string :is_active, :default => "1"
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
