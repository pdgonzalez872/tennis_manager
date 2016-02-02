class DrawPositionsController < ApplicationController

  def edit
    @dp = DrawPosition.find_by(id: params[:id])
    @player_options = Draw.fetch_player_options(@dp)
    # @match = Match.where(draw_positions: @dp)
  end

  def update
    byebug
    dp = DrawPosition.find_by(id: params[:id])
    dp.player = Player.find_by(name: params[:draw_position][:player])

    # if dp.save?
    #   redirect_to
    # else
    #
    # end
    # find the player with the name that is passed, thenif save redirect
  end

end
