class CreateMaintenanceComments < ActiveRecord::Migration
  def change
    create_table :maintenance_comments do |t|
      t.references :maintenance_request, index: true
      t.references :user, index: true
      t.string :comment

      t.timestamps
    end
  end
end
