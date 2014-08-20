class CreateBuildingUsers < ActiveRecord::Migration
  def change
    create_table :building_users do |t|
      t.references :building, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
