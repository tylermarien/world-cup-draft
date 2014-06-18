class Team < ActiveRecord::Base
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :players
  
  def calculate_total
    calculate_points_from_countries + calculate_points_from_players
  end
  
  def calculate_points_from_countries
    countries.reduce(0) { |sum, c| sum + c.calculate_total }
  end
  
  def calculate_points_from_players
    players.reduce(0) { |sum, p| sum + p.calculate_total }
  end
  
  def to_s
    name
  end
end
