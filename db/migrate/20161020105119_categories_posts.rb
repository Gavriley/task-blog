class CategoriesPosts < ActiveRecord::Migration
  def change
  	create_table :categories_posts do |t|
  		t.belongs_to :category, index: true
  		t.belongs_to :post, index: true
  	end	
  	add_index :categories_posts, [:category, :post]
  end
end
