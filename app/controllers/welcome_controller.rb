class WelcomeController < ApplicationController

  def index
    @teams = Team.order(total: :desc)
  end

end
