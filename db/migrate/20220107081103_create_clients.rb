class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name, null: false, default: ""
      t.string :zipcode, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :phone_number, null: false, default: ""
      t.string :supervisor, default: ""
      t.string :supervisor_phone_number, default: ""
      t.timestamps
    end
  end
end
