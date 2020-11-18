class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.string :channel_id
      t.string :channel_description
      t.string :channel_status

      t.timestamps
    end
  end
end
