class PlayersController < ApplicationController

  def show
    @player = Player.find_by(id: params[:id])
  end

end
