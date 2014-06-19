class PlayersController < ApplicationController
  
  # GET /players/most_popular
  def most_popular
    @players = Player.most_popular
  end
  
end
