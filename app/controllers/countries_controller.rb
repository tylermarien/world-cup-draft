class CountriesController < ApplicationController
  
  # GET /countries/1
  # GET /countries/1.json
  def show
    @country = Country.find(params[:id])
  end
  
end
