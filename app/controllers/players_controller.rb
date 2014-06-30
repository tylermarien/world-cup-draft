class PlayersController < ApplicationController
  
  # GET /players/1
  def show
    @player = Player.find(params[:id])
  end

  # GET /players/most_popular
  def most_popular
    @players = Player.most_popular
  end
  
end
