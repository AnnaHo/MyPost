class CreateGroupUsers < ActiveRecord::Migration
  def up
    create_table :group_users do |t|
    	t.integer :group_id, :user_id
    end
  end
  def down
  	drop_table :group_users
  end
end