class AddCompletedbyToChallenges < ActiveRecord::Migration
  def self.up
    add_column :challenges, :completed_by, :integer
  end

  def self.down
    remove_column :challenges, :completed_by
  end
end
