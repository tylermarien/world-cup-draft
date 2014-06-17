require 'httparty'

class Match < ActiveRecord::Base
  belongs_to :home, class_name: "Country"
  belongs_to :away, class_name: "Country"
  has_many :goals
  
  include HTTParty
  base_uri 'http://worldcup.kimonolabs.com/api'
  default_params apikey: '579797cddf38492d583969f7517a866c'
  format :json  
  
  def self.import
    response = get('/matches')
    json = JSON.parse(response.body)
    json.each do |m|
      match = Match.find_or_initialize_by(api_id: m['id'])
      match.occurs_at = m['startTime']
      match.home = Country.find_by(api_id: m['homeTeamId'])
      match.away = Country.find_by(api_id: m['awayTeamId'])
      match.home_score = m['homeScore']
      match.away_score = m['awayScore']
      match.status = m['status']
      match.save
    end    
  end  
  
  def winning_country
    return self.home if self.home_score > self.away_score
    return self.away if self.away_score > self.home_score
    return nil
  end
  
  def tie?
    self.home_score == self.away_score
  end
  
  def to_s
    home.name + " vs " + away.name
  end
end
