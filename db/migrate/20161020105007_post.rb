class Post < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :title, null: false, default: "", limit: 70
  		t.text :content, default: ""
  		t.boolean :published, null: false, default: true
  		t.attachment :thumbnail

  		t.timestamps null: false
  	end	
  end
end
