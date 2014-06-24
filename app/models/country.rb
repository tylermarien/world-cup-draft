require 'httparty'

class Country < ActiveRecord::Base
  belongs_to :group
  has_many :players
  has_and_belongs_to_many :teams
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_id'
  
  scope :most_popular, -> { select("#{Country.table_name}.*, COUNT(#{Team.table_name}.id) AS number_of_teams").joins(:teams).group("#{Country.table_name}.id").order("COUNT(#{Team.table_name}.id) DESC") }
  
  include HTTParty
  base_uri 'http://worldcup.kimonolabs.com/api'
  default_params apikey: '579797cddf38492d583969f7517a866c'
  format :json  
  
  def self.import
    response = get('/teams')
    json = JSON.parse(response.body)
    json.each do |team|
      #group = Group.find_or_initialize_by(name: team['group'])
      #group.save
      
      country = Country.find_or_initialize_by(api_id: team['id'])
      country.name = team['name']
      country.logo = team['logo']
      country.group_rank = team['groupRank']
      country.group_points = team['groupPoints']
      country.matches_played = team['matchesPlayed']
      country.wins = team['wins']
      country.losses = team['losses']
      country.draws = team['draws']
      country.goals_for = team['goalsFor']
      country.goals_against = team['goalsAgainst']
      country.group = Group.find_by(name: team['group'])
      country.save
    end    
  end
  
  def calculate_total
    self.calculate_points_from_matches_played \
      + self.calculate_points_from_wins \
      + self.calculate_points_from_ties \
      + self.calculate_points_from_goal_differential \
      + self.calculate_points_from_shutouts \
      + self.calculate_points_from_group_rank
  end
  
  def calculate_points_from_matches_played
    matches_played
  end
  
  def calculate_points_from_wins
    wins * 4
  end
  
  def calculate_points_from_ties
    draws * 2
  end
  
  def calculate_points_from_goal_differential
    goal_differential
  end  
  
  def calculate_points_from_shutouts
    shutouts
  end
  
  def calculate_points_from_group_rank
    return 0 unless group.completed?
    case group_rank
    when 1
      return 4
    when 2
      return 2
    when 3
      return 1
    else
      return 0
    end
  end
  
  def ties
    self.draws 
  end
  
  def goal_differential
    difference = 0
    self.home_matches.where(status: "Final").each do |m|
      if m.home_score > m.away_score
        difference += m.home_score - m.away_score
      end
    end
    self.away_matches.where(status: "Final").each do |m|
      if m.away_score > m.home_score
        difference += m.away_score - m.home_score
      end
    end
    return difference 
  end
  
  def shutouts
    shutouts = 0
    self.home_matches.where(status: "Final").each do |m|
      if m.away_score == 0
        shutouts += 1
      end
    end
    self.away_matches.where(status: "Final").each do |m|
      if m.home_score == 0
        shutouts += 1
      end
    end
    return shutouts      
  end
  
  def to_s
    name
  end
end
