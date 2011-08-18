class AddStartedbyToChallenges < ActiveRecord::Migration
  def self.up
    add_column :challenges, :started_by, :integer
  
  end

  def self.down
    remove_column :challenges, :started_by
  end
end
