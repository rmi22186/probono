class CreateApartmentUsers < ActiveRecord::Migration
  def change
    create_table :apartment_users do |t|
      t.references :apartment, index: true
      t.references :user, index: true
      t.date :lease_start
      t.date :lease_end
      t.boolean :active

      t.timestamps
    end
  end
end
