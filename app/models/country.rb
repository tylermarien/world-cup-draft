require 'httparty'

class Country < ActiveRecord::Base
  has_many :players
  has_and_belongs_to_many :teams
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_id'
  
  include HTTParty
  base_uri 'http://worldcup.kimonolabs.com/api'
  default_params apikey: '579797cddf38492d583969f7517a866c'
  format :json  
  
  def self.import
    response = get('/teams')
    json = JSON.parse(response.body)
    json.each do |team|
      country = Country.find_or_initialize_by(api_id: team['id'])
      country.name = team['name']
      country.logo = team['logo']
      country.group = team['group']
      country.group_rank = team['groupRank']
      country.group_points = team['groupPoints']
      country.matches_played = team['matchesPlayed']
      country.wins = team['wins']
      country.losses = team['losses']
      country.draws = team['draws']
      country.goals_for = team['goalsFor']
      country.goals_against = team['goalsAgainst']
      country.save
    end    
  end
  
  def ties
    self.draws 
  end
  
  def goal_differential
    self.goals_for - self.goals_against
  end
  
  def shutouts
    shutouts = 0
    self.home_matches.where(played: true).each do |m|
      if m.away_goals == 0
        shutouts += 1
      end
    end
    self.away_matches.where(played: true).each do |m|
      if m.home_goals == 0
        shutouts += 1
      end
    end
    return shutouts      
  end
  
  def to_s
    name
  end
end
