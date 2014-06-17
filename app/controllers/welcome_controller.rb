class WelcomeController < ApplicationController
  
  def index
    @teams = Team.all.sort { |a, b| b.calculate_total <=> a.calculate_total }
  end
  
end
