class DrawPositionsController < ApplicationController

  def edit
    @dp = DrawPosition.find_by(id: params[:id])
    # raise
    @player_options = Player.all
    # @player_options = Draw.fetch_player_options(@dp)
  end

  def update

    # raise
    # dp = DrawPosition.find_by(id: params[:id])

    tournament = Tournament.find_by(id: params[:tournament_id])

    draw = Draw.find_by(id: params[:draw_id])

    match = draw.matches.find_by(match_number: params[:id])

    dp = draw.draw_positions.find_by(draw_positions_number: params[:id])

    player = Player.find_by(id: params[:draw_position][:winner])
    # player_options = params[:draw_position][:player_options]
    #
    # draw  = dp.draw
    # match = dp.match
    # previous_match = Match.find_by(match_number: params[:id])
    # previous_match.update_winner_and_loser(winner: player, player_options: player_options)
    match.update_score(params[:draw_position][:score])

    if dp.players << player
      redirect_to tournament_draw_path(tournament_id: tournament.id,
                                                  id: draw.id)
    else
      render "edit"
    end
  end
end
