class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :worker_id
      t.integer :client_id
      t.string :name, null: false, default: ""
      t.text :body, null: false, default: ""
      t.string :image_id
      t.integer :work_status, null: false, default: 0
      t.time :strat_time
      t.time :finish_time

      t.timestamps
    end
  end
end
