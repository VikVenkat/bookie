class AddUserToChallenges < ActiveRecord::Migration
  def self.up
    add_column :challenges, :user_id, :integer
  end

  def self.down
    remove_column :challenges, :user_id
  end
end
