class AddApartmentValidationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apartment_validation, :string
  end
end
