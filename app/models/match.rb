class Match < ActiveRecord::Base
  belongs_to :home, class_name: "Country"
  belongs_to :away, class_name: "Country"
end
