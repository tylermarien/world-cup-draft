class Team < ActiveRecord::Base
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :players
  
  def calculate_total
    players.inject(0) { |sum, p| sum + (p.calculate_goals * 3) }
  end
  
  def to_s
    name
  end
end
