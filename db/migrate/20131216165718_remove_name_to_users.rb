class RemoveNameToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :name, :string
  end
end
