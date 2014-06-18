class Team < ActiveRecord::Base
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :players
  
  def calculate_total
    self.calculate_points_countries \
      + self.calculate_points_from_goals
  end
  
  def calculate_points_countries
    countries.reduce(0) { |sum, c| sum + c.calculate_total }
  end
  
  def calculate_points_from_goals
    players.reduce(0) { |sum, p| sum + (p.goals * 2) }
  end  
  
  def to_s
    name
  end
end
