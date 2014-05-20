class Goal < ActiveRecord::Base
  belongs_to :match
  belongs_to :country
  belongs_to :player
end
