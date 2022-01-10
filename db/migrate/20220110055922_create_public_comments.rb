class CreatePublicComments < ActiveRecord::Migration[5.2]
  def change
    create_table :public_comments do |t|
      t.integer :record_id
      t.text :comment

      t.timestamps
    end
  end
end