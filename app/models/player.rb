class Player < ActiveRecord::Base
  belongs_to :country
  has_many :goals
  has_and_belongs_to_many :teams
  
  def number_of_goals
    goals.count
  end
  
  def to_s
    name
  end
end
