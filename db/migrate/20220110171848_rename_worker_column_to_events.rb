class RenameWorkerColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :worker, :worker_id
  end
end
