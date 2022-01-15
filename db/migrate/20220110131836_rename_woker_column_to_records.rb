class RenameWokerColumnToRecords < ActiveRecord::Migration[5.2]
  def change
    rename_column :records, :woker_id, :worker_id
  end
end
