class CountriesController < ApplicationController
  
  # GET /countries/1
  def show
    @country = Country.find(params[:id])
  end
  
  # GET /countries/most_popular
  def most_popular
    @countries = Country.most_popular
  end
  
end
