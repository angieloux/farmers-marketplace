class RemoveCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :listings, :category_id
    add_column :listings, :category, :string, null: false

    drop_table :categories do |t|
      t.string :name

      t.timestamps
    end    
  end
end
