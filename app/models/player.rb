require 'httparty'

class Player < ActiveRecord::Base
  belongs_to :country
  has_and_belongs_to_many :teams
  
  scope :most_popular, -> { select("#{Player.table_name}.*, COUNT(#{Team.table_name}.id) AS number_of_teams").joins(:teams).group("#{Player.table_name}.id").order("COUNT(#{Team.table_name}.id) DESC") }
  
  include HTTParty
  base_uri 'http://worldcup.kimonolabs.com/api'
  default_params apikey: '579797cddf38492d583969f7517a866c'
  format :json
  
  def calculate_total
    calculate_points_from_goals
  end
  
  def calculate_points_from_goals
    goals * 2
  end
  
  def calculate_points_from_shootout_goals
    shootout_goals
  end
  
  def self.import
    response = get('/players', query: {limit: 1000})
    json = JSON.parse(response.body)
    json.each do |p|
      player = Player.find_or_initialize_by(api_id: p['id'])
      player.name = p['nickname']
      player.country = Country.find_by(api_id: p['teamId'])
      player.image = p['image']
      player.goals = p['goals']
      player.own_goals = p['own_goals']
      player.penalty_goals = p['penalty_goals']
      player.save
    end    
  end
  
  def to_s
    name
  end
end
