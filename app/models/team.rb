class Team < ActiveRecord::Base
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :players
  
  def calculate_total
    self.calculate_points_from_goals \
      + self.calculate_points_from_matches_played \
      + self.calculate_points_from_wins \
      + self.calculate_points_from_goal_differential
  end
  
  def calculate_points_from_goals
    players.reduce(0) { |sum, p| sum + (p.calculate_goals * 2) }
  end
  
  def calculate_points_from_matches_played
    countries.reduce(0) { |sum, c| sum + c.matches_played }
  end
  
  def calculate_points_from_wins
    countries.reduce(0) { |sum, c| sum + (c.wins * 4) }
  end
  
  def calculate_points_from_ties
    0
  end
  
  def calculate_points_from_goal_differential
    countries.reduce(0) { |sum, c| sum + c.goal_differential }
  end  
  
  def to_s
    name
  end
end
