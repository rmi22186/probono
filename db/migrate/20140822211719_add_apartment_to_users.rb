class AddApartmentToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :apartment, index: true
  end
end
