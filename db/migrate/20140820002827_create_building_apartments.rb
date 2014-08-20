class CreateBuildingApartments < ActiveRecord::Migration
  def change
    create_table :building_apartments do |t|
      t.references :building, index: true
      t.references :apartment, index: true

      t.timestamps
    end
  end
end
