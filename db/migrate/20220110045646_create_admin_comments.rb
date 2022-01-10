class CreateAdminComments < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_comments do |t|
      t.text :comment
      t.integer :record_id

      t.timestamps
    end
  end
end
