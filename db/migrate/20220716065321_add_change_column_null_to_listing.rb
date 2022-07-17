class AddChangeColumnNullToListing < ActiveRecord::Migration[6.1]
  def up 
    change_column_null :listings, :title, false, "Default"
    change_column_null :listings, :artist, false, "Default"
    change_column_null :listings, :condition, false, "good_condition"
    change_column_null :listings, :genre, false, "rock"
    change_column_null :listings, :price, false, 50
  end 
end
