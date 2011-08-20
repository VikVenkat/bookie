class AddCompleteDatetoChallenges < ActiveRecord::Migration
  def self.up
    add_column :challenges, :complete_date, :date
  end

  def self.down
    remove_column :challenges, :complete_date
  end
end
