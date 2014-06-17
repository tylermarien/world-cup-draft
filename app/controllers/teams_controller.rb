class TeamsController < ApplicationController
  
  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
  end  
  
end
