class Match < ActiveRecord::Base
  belongs_to :home, class_name: "Country"
  belongs_to :away, class_name: "Country"
  has_many :goals
  
  def home_goals
    self.goals.where(country_id: self.home.id).count
  end
  
  def to_s
    home.name + " vs " + away.name
  end
end
