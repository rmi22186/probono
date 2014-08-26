class CreateMaintenanceRequests < ActiveRecord::Migration
  def change
    create_table :maintenance_requests do |t|
      t.references :apartment, index: true
      t.string :status, :default => 'Open', :null => false
      t.string :priority
      t.string :description
      t.boolean :email_updates
      t.references :user, index: true
      t.timestamps
    end
  end
end
