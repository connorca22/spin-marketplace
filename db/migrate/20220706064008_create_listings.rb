class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :artist
      t.integer :condition
      t.integer :genre
      t.integer :price
      t.boolean :sold, default: false
      t.references :user, null: false, foreign_key: true
      t.references :product_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
