class Country < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_id'
  
  def matches_played
    self.home_matches.where(played: true).count + self.away_matches.where(played: true).count
  end
  
  def wins
    self.home_matches.count { |m| m.winning_team.id == self.id } + self.away_matches.count { |m| m.winning_team.id == self.id }
  end
  
  def ties
    0
  end
  
  def to_s
    name
  end
end
