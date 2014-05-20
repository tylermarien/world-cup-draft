class Goal < ActiveRecord::Base
  belongs_to :match
  belongs_to :country
  belongs_to :player
  
  def to_s
    match + ": " + country.name + " " + player.name
  end
end
