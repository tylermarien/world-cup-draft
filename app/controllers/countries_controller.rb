class CountriesController < ApplicationController
  
  # GET /countries/1
  def show
    @country = Country.find(params[:id])
  end
  
  # GET /countries/most_popular
  def most_popular
    @countries = Country.all.select("#{Country.table_name}.*, COUNT(#{Team.table_name}.id) AS number_of_teams").joins(:teams).group(:id).order("COUNT(#{Team.table_name}.id) DESC")
  end
  
end
