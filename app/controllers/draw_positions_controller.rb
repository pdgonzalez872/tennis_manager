class DrawPositionsController < ApplicationController

  def edit
    @dp = DrawPosition.find_by(id: params[:id])
    @player_options = Draw.fetch_player_options(@dp)
    # @match = Match.where(draw_positions: @dp)
  end

  def update
    dp = DrawPosition.find_by(id: params[:id])
    player = Player.find_by(name: params[:draw_position][:player])

    if dp.player = player
      dp.match.players << player
      redirect_to tournament_draw_path(tournament_id: dp.draw.tournament.id,
                                       id: dp.draw.id)
    else
      render "edit"
    end
    # find the player with the name that is passed, thenif save redirect
  end

end
