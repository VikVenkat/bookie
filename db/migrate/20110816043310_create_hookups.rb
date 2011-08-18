class CreateHookups < ActiveRecord::Migration
  def self.up
    create_table :hookups do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :hookups
  end
end
