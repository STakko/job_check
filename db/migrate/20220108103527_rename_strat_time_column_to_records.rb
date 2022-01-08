class RenameStratTimeColumnToRecords < ActiveRecord::Migration[5.2]
  def change
     rename_column :records, :strat_time, :start_time
  end
end
