class Country < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_id'
  
  def matches_played
    self.home_matches.where(played: true).count + self.away_matches.where(played: true).count
  end
  
  def wins
    wins = 0
    self.home_matches.where(played: true).each do |m|
      if !m.winning_country.nil? && m.winning_country.id == self.id
        wins = wins + 1
      end
    end
    self.away_matches.where(played: true).each do |m|
      if !m.winning_country.nil? && m.winning_country.id == self.id
        wins = wins + 1
      end
    end    
    return wins
  end
  
  def ties
    ties = 0
    self.home_matches.where(played: true).each do |m|
      if m.tie?
        ties = ties + 1
      end
    end
    self.away_matches.where(played: true).each do |m|
      if m.tie?
        ties = ties + 1
      end
    end
    return ties
  end
  
  def goals_for
    goals = 0
    self.home_matches.where(played: true).each do |m|
      goals += m.home_goals
    end
    self.away_matches.where(played: true).each do |m|
      goals += m.away_goals
    end
    return goals
  end
  
  def goals_against
    goals = 0
    self.home_matches.where(played: true).each do |m|
      goals += m.away_goals
    end
    self.away_matches.where(played: true).each do |m|
      goals += m.home_goals
    end
    return goals    
  end
  
  def goal_differential
    self.goals_for - self.goals_against
  end
  
  def to_s
    name
  end
end
