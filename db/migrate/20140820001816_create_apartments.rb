class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :unit
      t.float :bedrooms
      t.float :bathrooms
      t.string :floorplan
      t.string :image

      t.timestamps
    end
  end
end
