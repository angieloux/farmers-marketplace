class AddImageFilenameToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :image_filename, :string
  end
end
