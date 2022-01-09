class CreateRecordComments < ActiveRecord::Migration[5.2]
  def change
    create_table :record_comments do |t|
      t.text :comment
      t.integer :shared_user_id
      t.integer :admin_id
      t.integer :record_id

      t.timestamps
    end
  end
end
