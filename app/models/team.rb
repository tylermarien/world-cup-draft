class Team < ActiveRecord::Base
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :players
  
  def total
    players.inject(0) { |sum, p| sum + (p.number_of_goals * 3) }
  end
  
  def to_s
    name
  end
end
