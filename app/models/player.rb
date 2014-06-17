require 'httparty'

class Player < ActiveRecord::Base
  belongs_to :country
  has_and_belongs_to_many :teams
  
  include HTTParty
  base_uri 'http://worldcup.kimonolabs.com/api'
  default_params apikey: '579797cddf38492d583969f7517a866c'
  format :json
  
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
