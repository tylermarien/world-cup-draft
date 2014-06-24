class Group < ActiveRecord::Base
  has_many :countries
  
  def completed?
    true unless countries.where("matches_played < ?", 3).count > 0
  end
  
end
