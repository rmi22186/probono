class AddTitleToMaintenanceRequests < ActiveRecord::Migration
  def change
    add_column :maintenance_requests, :title, :string
  end
end
