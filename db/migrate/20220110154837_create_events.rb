class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :worker
      t.string :title
      t.text :content
      t.datetime :start_time

      t.timestamps
    end
  end
end
