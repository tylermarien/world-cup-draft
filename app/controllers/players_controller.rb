class PlayersController < ApplicationController
  
  def most_popular
    @players = Player.most_popular
  end
  
end
