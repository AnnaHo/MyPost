class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
    	t.integer :group_id
    	t.text :content
    	t.timestamps
    end
  end

  def down
  	drop_table :posts
  end
end
