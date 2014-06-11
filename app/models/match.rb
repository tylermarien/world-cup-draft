class Match < ActiveRecord::Base
  belongs_to :home, class_name: "Country"
  belongs_to :away, class_name: "Country"
  has_many :goals
  
  def home_goals
    self.goals.where(country_id: self.home.id).count
  end
  
  def away_goals
    self.goals.where(country_id: self.away.id).count
  end
  
  def winning_country
    return self.home if self.home_goals > self.away_goals
    return self.away if self.away_goals > self.home_goals
    return nil
  end
  
  def tie?
    self.home_goals == self.away_goals
  end
  
  def to_s
    home.name + " vs " + away.name
  end
end
