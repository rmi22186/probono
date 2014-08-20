class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :street
      t.string :city
      t.string :string
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
