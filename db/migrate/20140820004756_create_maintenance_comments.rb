class CreateMaintenanceComments < ActiveRecord::Migration
  def change
    create_table :maintenance_comments do |t|
      t.references :maintenancerequest, index: true
      t.references :user, index: true
      t.string :comment

      t.timestamps
    end
  end
end
