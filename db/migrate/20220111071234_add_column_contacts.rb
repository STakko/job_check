class AddColumnContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :tit, :string
  end
end
