class AddNameAndDateToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :username, :string
    add_column :listings, :date_created, :datetime
  end
end
