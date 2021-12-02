class CreateProduce < ActiveRecord::Migration[6.1]
  def change
    create_table :produce do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
