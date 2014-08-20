class AddUniqueToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :unique_id, :string
  end
end
