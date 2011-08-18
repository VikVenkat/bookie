class CreateChallenges < ActiveRecord::Migration
  def self.up
    create_table :challenges do |t|
	  t.string :challenge_name
	  t.string :challenge_type
	  t.date :challenge_date
	  t.date :due_date
	  t.string :wager
	  t.integer :wager_qty      
	  t.string :challenger_name
	  t.string :challenger_email
	  t.boolean :complete
	  t.timestamps
    end
  end

  def self.down
    drop_table :challenges
  end
end
