class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :zipcode, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :supervisor
      t.string :supervisor_phone_number
      t.timestamps
    end
  end
end
