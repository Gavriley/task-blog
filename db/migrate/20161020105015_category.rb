class Category < ActiveRecord::Migration
  def change
  	create_table :categories do |t|
  		t.string :name, null: false, default: "", limit: 50 
  	end	

  	add_index :categories, :name, unique: true
  end
end
