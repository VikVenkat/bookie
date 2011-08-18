class AddChalAndUserToHookup < ActiveRecord::Migration
  def self.up
    add_column :hookups, :challenge_id, :integer
	add_column :hookups, :user_id, :integer
  end

  def self.down
    remove_column :hookups, :challenge_id
	remove_column :hookups, :user_id
  
  end
end
