class DrawPositionsController < ApplicationController

  def edit
    @dp = DrawPosition.find_by(id: params[:id])
    @player_options = Draw.fetch_player_options(@dp)
  end

  def update
    # There is a mathematical relationship where the draw_position id
    # is the same as the Match number. I use this to update both
    # the draw position and also the match.
    dp = DrawPosition.find_by(id: params[:id])
    player = Player.find_by(name: params[:draw_position][:winner])
    player_options = params[:draw_position][:player_options]

    # This messed up my draw. Bad, bad design.
    previous_match = Match.find_by(match_number: params[:id])

    previous_match.update_winner_and_loser(winner: player, player_options: player_options)
    # previous_match.winner=(player.id)
    # previous_match.calculate_loser
    # previous_match.save
    # raise params

    if dp.players << player
      redirect_to tournament_draw_path(tournament_id: dp.draw.tournament.id,
                                                  id: dp.draw.id)
    else
      render "edit"
    end
  end
end
