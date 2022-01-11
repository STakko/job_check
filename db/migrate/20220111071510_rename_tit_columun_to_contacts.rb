class RenameTitColumunToContacts < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :tit, :title
  end
end
