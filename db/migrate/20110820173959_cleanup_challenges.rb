class CleanupChallenges < ActiveRecord::Migration
  def self.up
    remove_column :challenges, :wager_qty
	remove_column :challenges, :challenger_name
	remove_column :challenges, :challenger_email
	remove_column :challenges, :challenge_type
  end

  def self.down
    add_column :challenges, :wager_qty, :integer
	add_column :challenges, :challenger_name, :string
	add_column :challenges, :challenger_email, :string
	add_column :challenges, :challenge_type, :string
  end
end
