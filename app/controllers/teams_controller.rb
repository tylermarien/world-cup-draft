class TeamsController < ApplicationController
  
  # GET /teams/1
  def show
    @team = Team.find(params[:id])
  end
  
end
