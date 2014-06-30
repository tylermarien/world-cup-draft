class Group < ActiveRecord::Base
  has_many :countries
  
  def completed?
    countries.each do |c|
      return false if c.matches_played < 3
    end
    return true
  end
  
end
