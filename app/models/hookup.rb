class Hookup < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  
  #validates_uniqueness_of :random


end
