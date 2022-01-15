class ChangeWokersToWorkers < ActiveRecord::Migration[5.2]
  def change
    rename_table :wokers, :workers
  end
end
